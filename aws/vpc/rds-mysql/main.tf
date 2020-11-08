provider "aws" {
  region = var.aws_region
}

##############################################################
# Data sources to get VPC, subnets and security group details
##############################################################

data "aws_subnet_ids" "all" {
  vpc_id = var.vpc_id
}

#data "aws_security_group" "default" {
#  vpc_id = var.vpc_id
#  name   = var.sg_name
#}

resource "aws_security_group" "default" {
  name        = var.sg_name
  vpc_id      = var.vpc_id

  ingress {
    from_port = 3306
    to_port = 3306
    protocol = "tcp"
    cidr_blocks = var.cidr_blocks_1
  }

  ingress {
    from_port = 3306
    to_port = 3306
    protocol = "tcp"
    cidr_blocks = var.cidr_blocks_2
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = var.sg_name
  }
}

#####
# DB
#####
module "db" {
  source = "terraform-aws-modules/rds/aws"

  #create_db_parameter_group = false

  identifier = var.identifier

  # All available versions: http://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/CHAP_MySQL.html#MySQL.Concepts.VersionMgmt
  engine            = var.engine
  engine_version    = var.engine_version
  instance_class    = var.instance_class
  allocated_storage = var.storage
  storage_encrypted = var.storage_encrypted

  # kms_key_id        = "arm:aws:kms:<region>:<account id>:key/<kms key id>"
  name     = var.db_name
  username = var.username
  password = var.password
  port     = var.port

  vpc_security_group_ids = [aws_security_group.default.id]

  maintenance_window = "Mon:00:00-Mon:03:00"
  backup_window      = "03:00-06:00"

  multi_az = var.multi_az

  # disable backups to create DB faster
  backup_retention_period = 0

  tags = {
    Name = var.sg_name
  }

  #enabled_cloudwatch_logs_exports = ["audit", "general"]

  # DB subnet group
  subnet_ids = data.aws_subnet_ids.all.ids

  # DB parameter group  
  family = "mysql5.5"

  # DB option group
  major_engine_version = "5.5"

  # Snapshot name upon DB deletion
  final_snapshot_identifier = var.sg_name

  # Database Deletion Protection
#  deletion_protection = false
#
  parameters = [
    {
      name  = "character_set_client"
      value = "utf8"
    },
    {
      name  = "character_set_server"
      value = "utf8"
    }
  ]

#  options = [
#    {
#      option_name = "MARIADB_AUDIT_PLUGIN"
#
#      option_settings = [
#        {
#          name  = "SERVER_AUDIT_EVENTS"
#          value = "CONNECT"
#        },
#        {
#          name  = "SERVER_AUDIT_FILE_ROTATIONS"
#          value = "37"
#        },
#      ]
#    },
#  ]
}

variable "ec2_type" {
  description = "Tipo da instancia que criaremos."
  type        = string
  default     = "t2.micro"
}

variable "ami" {
  description = "Amis usadas na US-East-1"
  type = map
  default = {
      ubuntu = "ami-0c4f7023847b90238"
      windows = "ami-041306c411c38a789"
    }
}
  
variable "key_name" {
  description = "Nome da chave que sera usada para conectar na ec2."
  type        = string
  default     = "suachave"
}


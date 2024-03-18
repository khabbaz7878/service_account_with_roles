# variables.tf

variable "student_emails" {
  type = list(string) 
  default = [
    "email1",
    "email2",
    "email3"
  ]
}

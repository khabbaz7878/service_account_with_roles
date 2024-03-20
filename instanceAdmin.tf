# Get list of student emails 
variable "student_emails" {
  type = list(string)
  default = [
    "jaimeh26@gmail.com",
    "husni.khabbaz@gmail.com",
    "philippe.redston@gmail.com"
  ]
}



# Grant IAM permission to each student email
resource "google_project_iam_member" "instance_admin" {
  count = length(var.student_emails)

  project = "myproject"
  role    = "roles/compute.instanceAdmin"
  member  = "user:${var.student_emails[count.index]}"
}






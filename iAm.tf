# Define student users 
variable "student_users" {
  type = list(string)
  default = [
    "student1@example.com",
    "student2@example.com",
    "student3@example.com"
  ]
}

# Get current project ID
data "google_project" "project" {
  project_id = "my-project-id"
}

# Grant compute.instanceAdmin role to each student
resource "google_project_iam_member" "instance_admin" {
  count = length(var.student_users)

  project = data.google_project.project.project_id
  role    = "roles/compute.instanceAdmin"
  member  = "user:${var.student_users[count.index]}"
}

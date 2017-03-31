jobs index.html.erb

<% if job.employee_id %>
<span class="badge badge-pill badge-success">Filled</span>
<%else%>
<span class="badge badge-pill badge-danger">Open</span>
<% end %>

job show.html.erb

<%if !@job.employee%>
<%= link_to 'Edit', edit_job_path(@job), class: 'btn btn-success' %>
<%= link_to 'Delete', @job, method: :delete, data: { confirm: 'Are you sure?' }, class:"btn btn-outline-warning" %>
<%end%>

job_app update controller

@job = Job.find(@job_application.job_id)
@job.update(employee_id: @job_application.employee_id)
@job_apps_rejected = JobApplication.where(status: "In Progress", job_id: @job.id)
@job_apps_rejected.each do |job_app_rej|
  job_app_rej.update(status: "Unsuccessful")
end


job_app controller

#employer can only hire one applicant for the job posting
before_action :job_filled?, only: [:update]

def job_filled?
  if @job_application.job.employee
redirect_to :jobs, :alert => "Sorry, you have already picked someone for this !"
  end
end

class Project < ActiveRecord::Base
  has_many :tasks
  belongs_to :team
  has_many :posts
  has_many :users

  def collaborator_emails=(emails)
    email_array = emails.split(",").map{|email| email.strip}
    email_array.each do |email|
      collaborator = User.find_by(email: email)
      if collaborator == nil || collaborator == self.owner || self.collaborators.include?(collaborator)
        next
      end
      self.collaborators << collaborator
      self.save
    end
  end

  def collaborator_emails
    emails = self.collaborators.collect {|collaborator| collaborator.email}
    emails.join(", ")
  end

end

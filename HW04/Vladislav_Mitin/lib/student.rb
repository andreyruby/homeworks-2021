# frozen_string_literal: true

class Student
  attr_reader :name, :surname, :homeworks, :notifications

  def initialize(name:, surname:)
    @name = name
    @surname = surname
    @homeworks = []
    @notifications = []
  end

  def mark_as_read!
    @notifications.clear
  end

  def to_work!(homework)
    notification = Notification.new(homework: homework, text: "Work was started: #{homework.title}")
    homework.notify_mentor(notification)
    homework.status = 'in_progress'
  end

  def add_answer!(homework, answer)
    homework.answers << answer
  end

  def to_check!(homework)
    notification = Notification.new(homework: homework, text: "New answers to homework: #{homework.title}")
    homework.notify_mentor(notification)
    homework.status = 'ready_to_check'
  end
end

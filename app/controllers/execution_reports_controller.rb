class ExecutionReportsController < ApplicationController
  require "prawn"

  def index
    @event = Event.find(params[:event_id])
    @event = EventDecorator.decorate(@event)
    authorize @event
   
#        pdf.font Rails.root.join('app', 'assets', 'fonts', 'ubuntu.ttf')

    respond_to do |format|
      format.pdf do 
        pdf = Prawn::Document.new
        
        pdf.font_families.update(
          "UbuntuFontFamily" => {
                  :bold        => Rails.root.join('app', 'assets', 'fonts','Ubuntu-B.ttf'),
                  :italic      => Rails.root.join('app', 'assets', 'fonts','Ubuntu-LI.ttf'),
                  :bold_italic => Rails.root.join('app', 'assets', 'fonts','Ubuntu-BI.ttf'),
                  :normal      => Rails.root.join('app', 'assets', 'fonts','Ubuntu-R.ttf')
          }
        )
        
        pdf.font "UbuntuFontFamily"
        
        pdf.font_size 24
        pdf.text "Raport zbiórki #{TeamDecorator.decorate(@event.team).short_name.gsub(/[\s\n\t]+/, " ")}"
        
        pdf.font_size 20
        pdf.text duration_time
        
        pdf.move_down 20
        
        activities = [["Plan","opis", "wykonanie"]]
        
        pdf.font_size 12
        @event.activities.each do |activity|
          activities << [
            activity.name,
            activity.description,
            (activity.execution_report.content if activity.execution_report.present? && activity.execution_report.content.present?)
          ]
        end
        
        pdf.table(activities) do
          row(0).font_style = :bold
        end
        
        pdf.font_size 16
        pdf.move_down 20
        pdf.text "Uwagi:"
        
        send_data pdf.render, filename: "report_#{@event.starts_on}.pdf", type: 'application/pdf'
      end
    end
  end
  
  def duration_time
    "#{start_time} - #{end_time}"
  end
  
  def start_time
    "#{@event.starts_on.to_s} #{@event.starts_at}".to_time.
    strftime("%d.%m.%Y godz. %k:%M")
  end
  
  def end_time
    end_time = "#{@event.starts_on.to_s} #{@event.starts_at}".to_time + @event.duration
    end_time.strftime("%k:%M")
  end
  
#  def activity_params
#    params.require(:activity).permit(*policy(@activity || Activity).permitted_attributes)
#  end

end

class Doctor
    attr_accessor :appointments, :patients
    attr_reader :name
    @@all=[]

        def initialize(name)
            @name=name
            @@all << self
        end

        def self.all
            @@all
        end

        def appointments
            Appointment.all.select{|appointment| appointment.doctor==self}
        end

        def new_appointment(patient,date)
            Appointment.new(date,patient,self)
        end

        def patients
            self.appointments.collect{|appointment| appointment.patient}.uniq
        end

end
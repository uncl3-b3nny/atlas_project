class A2 < ActiveRecord::Base
  # to do: double check all these relationships. There was no belongs_to, which makes me feel like the rest of these are off.
  has_many :blueprints
  
  #Assemblies can have many assemblies directly through quantities       
  has_many :quantities     
  has_many :a5s, through: :quantities
  has_many :a4s, through: :quantities
  has_many :a3s, through: :quantities
  has_many :assemblies, through: :quantities# Can i just access the chain by calling @assembly.a2s or @assembly.a3s? So basically, will calling @a2.a5s include both a5s through quantities & through a4s through a3s? to do: test this^

  #Or "up" through the tiers## THIS IS UNECESSARY. the chain can be accessed through each level.
  
  # has_many :a3s, through: :a2s
  #   has_many :a4s, through: :a3s
  #     has_many :a5s, through: :a4s
      #More levels of nested assemblies can be added on an as-needed basis. Just be sure to add them to all appropriate models
  
  #Assemblies can have many 
  has_many :buildings, through: :quantities
  has_many :labors, through: :quantities  
  
  has_many :parts, through: :quantities 
  has_many :parts, through: :assemblies #if it has_many assemblies, can i just call a2.assemblies.parts?, or do i need to explicitly state that it ALSO has parts through assemblies. to do: test this. its the same question as above. so we either have to have a more complicated helper, or more complicated relationships. I'm leaning towards helper.

    has_many :raw_materials, through: :parts
    has_many :manufacturing_processes, through: :parts
      has_many :manufacturing_processes, through: :raw_materials

  has_many :buildings, through: :quantities

  #to do: differentiate between: 
  # part_manufacturing_processes & 
  # assembly_manufacturing_processes

  # has_many :a2_manufacturing_processes?
  # has_many :assembly_manufacturing_processes
        has_many :factories, through: :manufacturing_processes
          #Raw materials, parts, manufacturing processes & factories are important, because they are all required to construct an assembly. So to do: write helpers for "pre-requisite approvals" 
end

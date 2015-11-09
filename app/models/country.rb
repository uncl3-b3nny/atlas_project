class Country < ActiveRecord::Base

#relationships are complicated

  has_many :regions
    has_many :catalogues, through: :regions
      has_many :designs, through: :catalogues
          has_many :raw_materials, through: :designs #so will this stack overflow because there are multiple through routes for country.parts? (design.parts, buildings.parts & debts.parts) Or will it simply return ALL of them. I'm betting all, and in order to get a specific group, you'd have to call it by name such as: country.designs.parts  This would be a good place to write a few tests. 
          has_many :parts, through: :designs
          has_many :assemblies, through: :designs
          has_many :floorplans, through: :designs
    has_many :raw_materials, through: :regions
    has_many :factories, through: :regions
      has_many :manufacturing_processes, through: :factories
      # has_many :parts, through: :factories
      # has_many :assemblies, through: :factories
      has_many :tools, through: :factories
      #so this is where the catalogue & designs come in. You actually have separate catalogue offerings vs ACTUAL parts & assemblies accounted for in an entity. e.g. You may have designs for cedar & spruce 2x4s offered in a region, but only cedar has been used. 

    has_many :master_plans, through: :regions
      has_many :developments, through: :master_plans
        has_many :deeds, through: :developments
          has_many :lots, through: :deeds #"lots" Both lots & buildings belong to deeds, but buildings also belong to lots, which is how a Country tracks them.
            has_many :buildings, through: :lots
              has_many :quantities, through: :buildings
                # has_many :a5s,           through: :quantities
                # has_many :a4s,           through: :quantities
                # has_many :a3s,           through: :quantities
                # has_many :a2s,           through: :quantities
                has_many :assemblies,    through: :quantities #it works with, AND without this line.
                # has_many :parts,         through: :assemblies    
                # has_many :raw_materials, through: :quantities  

                #so this country can have a raw material through a part, through an assembly, as long as I pass through all the right IDs when its created. (using hidden fields)  

                  # has_many :quantities,      through: :a5s
                  has_many :a4s,             through: :a5s
                  has_many :a3s,             through: :a5s
                  has_many :a2s,             through: :a5s
                  has_many :assemblies,      through: :a5s
                  has_many :parts,           through: :a5s
                  has_many :raw_materials,   through: :a5s 
                  
                  # has_many :quantities,      through: :a4s
                  has_many :a3s,             through: :a4s
                  has_many :a2s,             through: :a4s
                  has_many :assemblies,      through: :a4s
                  has_many :parts,           through: :a4s
                  has_many :raw_materials,   through: :a4s  

                  # has_many :quantities,      through: :a3s
                  has_many :a2s,             through: :a3s
                  has_many :assemblies,      through: :a3s
                  has_many :parts,           through: :a3s
                  has_many :raw_materials,   through: :a3s  

                  # has_many :quantities,      through: :a2s
                  has_many :assemblies,      through: :a2s
                  has_many :parts,           through: :a2s
                  has_many :raw_materials,   through: :a2s  

                  has_many :parts,           through: :assemblies
                  # has_many :quantities,      through: :parts
                  has_many :raw_materials,   through: :assemblies    

                  # has_many :quantities,      through: :parts
                  has_many :raw_materials,   through: :parts
                  # has_many :quantities, through: :raw_materials


                  # has_many :quantities,      through: :raw_materials # so whats the "right way" to do this? obviously not what i did here.


#all i SHOULD have to do here is tell it has_many :super_joins, through: normal_models
#but because the queries being performed when calling something like super_join.normal_models is built off of active_record's belongs_to helper, it doesn't work.    

              has_many :construction_schedules, through: :buildings
                has_many :milestones, through: :construction_schedules
            has_many :construction_schedules, through: :lots
              has_many :milestones, through: :construction_schedules
    has_many :atlas_registrations, through: :regions
      has_many :participants, through: :atlas_registrations#participants can be accessed through regions, but I go through atlas_registrations 1.to make the code easier to understand/read and 2. to be consistent with the markdown of relationships, because some of these relationship chains access different segments of the same Class name.
        has_many :debts, through: :participants
          has_many :raw_materials, through: :debts
          has_many :parts, through: :debts
          has_many :assemblies, through: :debts
          has_many :labors, through: :debts#refactor Labor to LaborUnit & add QC
              # has_many :participants, through: :deeds
               #registration
               #labor?
               #QCs?
               #inventories/stockpiles?

#start here: MODEL join objects and see where and how to save quantities. scrap parts and assemblies for now. Just call them all products. product has_many buildings thru building_products. Product has many raw materials thru product_raws.  

  # to do's:
  # display all child tables on country view
  # build a design#show page
  # build relationships for inventory, organization, tools, credit & debt
  # add milestone attributes like status, responsible_parties, etc.
  # check whether or not/where to add quantities for raw materials in regions(like total harvestable stock)

# blueprint
#   belongs_to :lot
#   belongs_to :building
#   belongs_to :part
#   belongs_to :assembly

# floorplan
# belongs_to :building
# has_many :designs
# has_many :catalogues, through: :designs

# construction_schedule
#   has_many :milestones
#   belongs_to :building
#   belongs_to :lot

# bill_of_materials # this could likely be accomplished with a helper rather creating models. something like :

#   def bill_of_materials 
      # bill_of_materials = self.parts.raw_materials + self.assemblies.parts.raw_materials + self.parts + self.assemblies + self.assemblies.parts
#   end


# manufacturing_process
#   has_many :raw_materials
#   has_many :factory_manufacturing_processes
#   has_many :factories, through: :factory_manufacturing_processes
#   has_many :regions, through: :factories

# factory
#   belongs_to :regions
#   has_many :factory_manufacturing_processes
#   has_many :manufacturing_processes, through: :factory_manufacturing_processes

# factory_manufacturing_processes
#   belongs_to :manufacturing_process
#   belongs_to :factory

# raw_material
#   belongs_to :regions
#   belongs_to :manufacturing_processes #may need to make this a has_many through

# part
  # has_many :designs
  # has_many :catalogues, through: :designs

  # has_many :blueprints
  # has_many :raw_materials
  
  # has_many :manufacturing_processes
  #   has_many :factories, through: :manufacturing_processes
  #     has_many :regions, through: :factories
# we're going to want join objects for all the parts, assemblies & raw materials right? we'll want to have a quantity attribute, rather than creating zillions of objects. Perhaps this is phase two. For demonstration purposes, we can just have a few thousands objects.

# assembly
#   has_many :designs
#   has_many :catalogues, through :designs

#   has_many :parts
#   has_many :raw_materials, through: :parts
#   has_many :manufacturing_processes, through: :parts
#   has_many :manufacturing_processes
#   has_many :factories, through: :manufacturing_processes

# building
#   include :bill_of_materials

#   has_one :construction_schedule

#   has_many :blueprints
#   has_many :floorplans
#   has_many :parts
#   has_many :raw_materials, through: :parts 
#   has_many :assemblies
#   has_many :parts, through: :assemblies  

# design
#   belongs_to :raw_materials
#   belongs_to :parts
#   belongs_to :assemblies
#   belongs_to :blueprints
#   belongs_to :floorplans
#   belongs_to :manufacturing_processes


# country: USA
# region: Southeast
# master_plan: Mount Pleasant
# development: Indigo Wharf
# lot: "1"
# building: Jens house
# assembly: piano bench
# parts: iron screws, cedar 2x4s
# raw_materials: iron
# manufacturing_processes: mining, smelting, casting
# raw_materials: cedar
# manufacturing_processes: lumberjacking, sawmilling, pressure treating

# region
#   has_one :catalogue 

# catalogue
#   belongs_to :region 
#   has_many :designs
#   has_many :raw_materials, through :designs
#   has_many :parts, through :designs
#   has_many :assemblies, through :designs
#   has_many :floorplans, through :designs

end
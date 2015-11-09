# to do: play with the SQUEEL gem! it looks great for active record queries

#I chose to use a super join because: 1. using convention meant SOOOO many join tables & models. I simply didnt feel like navigating it all, 2. I'd rather store attributes in my DB than models. It keeps it smaller, and 3. I wanted the accessibility of rails methods without the headache of DEEPLY nested routing and relationships. I was wrong to think it would save time and resources. 

# Alternatives

# 0. A5 hierarchy for products
# 1. ancestry gem to allow products to have products. Use debts and credits to track productivity
# - you'll have to write a special method(s) to get the correct quantities. (sunk cost? gonna have to do that anyway, right? sure, but this will likely make it harder)
# 2. strict belongs_tos (lots of coding, and not sure resources will even be possible)
# 3. *******just make each join object belong to its parent join object?******** winner

#dealing with the products within products is not an urgent problem. I never should have started on it. 

# add model NaturalResource to remove problem of raw materials belonging to things in weird ways.

#TRY THIS: ancestry gem to allow quantities to have "ancestors". Store the "ancestor" IDs in the new column, then use that column to generate the appropriate multipliers for quantities. YEAHHHHHH START HERE: THIS WORKS. keep the quantities! save ancestor IDs in an array as attribute an of Quantity. 

So make sure that you assign all the necessary IDs upon creation of a debt. When you select products from catalogues, we'll create new Quantities to represent them, and

quantities will need both ancestor_ids and progeny_ids, so that we can create the appropriate children upon creation of an assembly for a debt. (so there must be only one possible class of descendants. And assuming its quantities, then we'll need "template" quantities that represent 1 unit of each unique part, assembly raw_material, etc. so that we can just include them in the progeny array)... this gets tought too. Still need a way to distuinguish between what values we should be summing and we shouldn't.

If we just assign each join object a "parent"(i.e. make each tier of join object belong to an upper tier of join objects) wouldn't that solve the ambiguity issue?

BASICALLY one solution is to remove ALL class distinctions by abstracting them into attributes, and even storing several abstractions in a single attribute field such as ancestors. This leads me to use just one big table, and the other is to use the class distinctions rails gives me and build gobs of tables. One is easier on resources, and the other is easier on developers. Tough call on which one would be more cost effective long term. 
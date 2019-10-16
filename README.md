HTTP Verb        |      Route        |      Action           |     Used for                     |           model        |  View
Recipe Table
get(rc.rb)             /recipes               index                displaying all recipes                   recipe.rb       index.erb
get "                 /recipes/:id           single               displaying 1 recipe                           "           single.erb
get                   /recipes/new         submission form           add recipes                                "            new.erb
get                 /recipes/:id/edit       update/edit            editing recipe                                            edit.erb
patch

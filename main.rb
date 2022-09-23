$data = [] #global to store data / Variable globale pour stocker les données

def check_number(number) #Define the function to call at each loop / Définit la fonction qui sera appelé à chaque boucle
  arr = number.split("") #Split the number to check each char more easily / Sépare le nombre pour contrôler chaque caractère plus facilement.
  a = arr[0]
  b = arr[1]
  c = arr[2]

  if a == b; return false end #If not unique, return false / pas unique, retourne false
  if b == c; return false end
  if a == c; return false end
  
  for nb in $data #Check if the combination already exists in the data array / verify si la combinaison exsite déjà dans notre tableau de données.
    temp = nb.split("").sort().join()
    temp_check = number.split("").sort().join()
    if temp == temp_check; return false end
  end

  return true
end

#main loop, call the function every time to check the number and push the new number if possible
#Boucle principale, elle appellera notre fonction créée pour valider les combinaisons, si possible, ajoutera une nouvelle combinaison  
for nb in 0..999 
  temp = nb.to_s.rjust(3, "0") #start from 0, but need 3 chars, so start with 001 002 003....
  to_add = check_number(temp)  
  if to_add
    $data.push(temp)
  end
end

puts $data #print final


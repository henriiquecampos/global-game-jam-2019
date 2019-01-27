extends Control

func _on_DogPhoto_tree_exited():
	$DialogueContainer/Dog.pop_in()

func _on_RomanceBook_tree_exited():
	$DialogueContainer/Book.pop_in()

func _on_FriendsPhoto_tree_exited():
	$DialogueContainer/Photo.pop_in()

func _on_Diary_tree_exited():
	$DialogueContainer/Diary.pop_in()

func _on_Food_tree_exited():
	$DialogueContainer/Food.pop_in()

func _on_Movie_tree_exited():
	$DialogueContainer/Movie.pop_in()

require 'spec_helper'

describe "Deleting todo items" do
	let!(:todo_list) { TodoList.create(title: "Grocery List", description: "Groceries")}
	let!(:todo_item) { todo_list.todo_items.create(content: "Milk") }

	it "is successful" do
		visit_todo_list(todo_list)
		within "#todo_item_#{todo_item.id}" do
			click_link "Delete"
		end
		expect(page).to have_content("Todo list item was deleted.")
		expect(TodoItem.count).to eq(0)
	end

end
module ApplicationHelper

  def border_line
    "block border border-black rounded-md px-4 py-1 focus:shadow-outline"
  end

  def button_style_bg_blue
    "bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded-md focus:shadow-outline"
  end

  def back_to_list_button
    link_to tasks_path, class: "flex text-blue-500 mt-10 items-center" do
      "Back to list"
    end
  end

  def task_form_label_styling
    "block text-gray-700 text-sm font-bold mb-2"
  end

  def task_form_text_field_styling
    "border border-gray-300 focus:outline-none rounded-md w-64 h-8 block placeholder-opacity-75"
  end
end

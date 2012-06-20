module CleanMyVomit
  def polish(my_hash=self, depth=0)
    if !reached_max_recursion_depth?(my_hash)
      my_hash.each do |key, value|
        if value.is_a? Hash
          print_hash(key, value, depth)
        elsif value.is_a? Array
          print_array(key, value, depth)
        else
          if key.is_a? Hash
            puts " "*depth + " {"
            polish(key, depth + 3)
            puts " "*depth + " }"
          # NOTE: not just `value`, because `value` could be `false`, in which case we want to print it out
          elsif !value.nil?
            puts " "*depth + key + " => #{value.to_s}"
          else
            puts " "*depth + key.to_s + ""
          end
          polish(value, depth + 3)
        end
      end
    end
  end

  private
  def reached_max_recursion_depth?(my_object)
    !(my_object.respond_to? :each)
  end

  # {"3" => { "3" => "2"}}
  def print_hash(key, value, depth)
    puts " "*depth + key + " {"
    polish(value, depth + 3)
    puts " "*depth + "}"
  end

  # { "3" => [3,2,3]}
  def print_array(key, value, depth)
    puts " "*depth + key + " =>["
    polish(value, depth + 3)
    puts " "*depth + "]"
  end
end

Hash.send(:include, CleanMyVomit)
Array.send(:include, CleanMyVomit)
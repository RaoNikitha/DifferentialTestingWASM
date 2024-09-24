;; 10. Construct a deeply nested series of `block` and `if` instructions with mismatched `end` tags and include a `br_table` targeting blocks with incorrect index alignment. Ensure that the `br_table` results in correct block termination and resumption, catching any incorrect nesting logic in implementations.

(assert_invalid
  (module (func $deeply_nested_and_invalid_br_table (result i32)
    (block (result i32)
      (block (result i32)
        (block (result i32)
          (if (result i32)
            (i32.const 1)
            (block (result i32) (br_table 1 2 3) end)
            end
          ) 
          end
        ) 
        end
      )
    ) 
  )) 
  "type mismatch"
)
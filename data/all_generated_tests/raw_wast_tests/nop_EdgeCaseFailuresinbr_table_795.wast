;; 6. Write a test where a `br_table` instruction's default target is placed after a series of `nop` instructions, and the index provided exceeds the number of direct targets. Check for correct transition to the default target, ignoring the preceding `nop` instructions.

(assert_invalid
  (module
    (func $br_table_test
      (block $default
        (br_table 1 1 1 $default 
          (nop) (nop) (nop))))
  "br_table default target must ignore nop instructions"
)
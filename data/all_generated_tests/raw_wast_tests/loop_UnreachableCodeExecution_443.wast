;; Construct a loop that includes a `br_table` instruction where an index out of bounds leads to a default target with an `unreachable` instruction. Check that valid indices never result in reaching the `unreachable`.

(assert_invalid
 (module 
  (func $test_br_table 
   (block 
    (loop 
     (br_table 0 1 2 1 (i32.const 1))
     (unreachable)
    )
   )
  ) 
 )
 "type mismatch"
)
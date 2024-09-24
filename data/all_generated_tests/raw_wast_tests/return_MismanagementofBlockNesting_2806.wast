;; 5. Generate a test featuring nested blocks with intermediary instructions involving different data manipulations. Insert a `return` at the deep nest level to confirm operand stack integrity and that the correct block is targeted after data manipulation operations.

(assert_invalid
 (module
  (func $nested-blocks-with-return
   (block (block (block
    (i32.const 42)
    (i32.add (return) (i32.const 1))
   )))
  )
 )
 "type mismatch"
)
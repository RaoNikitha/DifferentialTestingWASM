;; 9. Implement a scenario involving an `if-else` chain within a loop nested inside another `block`. Use a `br` instruction to jump out of the innermost `if` block to the outer block or loop. Validate that the bytecode interpreters correctly maintain stack integrity and control flow consistency for nested blocks.

(assert_invalid
 (module
  (func $test-loop-if-br
   (block $outer
    (loop $inner 
     (block $if-block
      (i32.const 0)
      (if (then (br $outer)))
     )
     (br $inner)
    )
   )
  )
  "type mismatch"
 )
)
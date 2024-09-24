;; 2. Use a `block` instruction containing a loop with `br_if` checking an `i32.const` value generated by a sequence of arithmetic operations inside the block. This test will validate that the sequence properly impacts the condition.

(assert_invalid
 (module (func $block_loop_br_if_arithmetic (result i32)
   (block (result i32)
     (loop
       (br_if 1 (i32.eq (i32.add (i32.const 1) (i32.mul (i32.const 2) (i32.const 3))) (i32.const 7)))
       (i32.const 0)
     )
   )
 ))
 "type mismatch"
)
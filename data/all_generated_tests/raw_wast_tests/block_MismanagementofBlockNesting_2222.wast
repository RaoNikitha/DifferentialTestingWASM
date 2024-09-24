;; 3. **Test 3: Loop Nesting and Block Interaction**    - **Description:** Mix of nested loop and block structures with forward branches from within the loop to the outer block.    - **Constraint:** Checks the correct interaction and handling of nested loops and blocks.    - **Mismanagement Check:** Incorrect label index calculation where loops are involved, leading to incorrect block exits.

(assert_invalid
  (module (func $loop-nesting-block-forward-branch
    (block $outer (result i32)
      (i32.const 1)
      (loop $inner
        (block $inner_block
          (br 1) ;; Branch to outer block, not nested block
        )
      )
    )
  ))
  "type mismatch"
)
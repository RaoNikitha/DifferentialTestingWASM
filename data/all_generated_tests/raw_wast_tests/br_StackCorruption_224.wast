;; 5. **Test Multiple Br Instructions to Loop Start:**    - **Description:** Have multiple `br` instructions within a loop that branch back to the loop’s start.    - **Reasoning:** This test checks for correct stack behavior with multiple backward branches.    - **Constraint:** Ensure backward branches maintain correct operand order and stack height.    - **Relation to Stack Corruption:** Incorrect stack management in backward branches can lead to corrupted input values on loop iterations.

(assert_invalid
 (module
  (func $test-stack-correctness
   (block $loop_block
    (loop $loop
     (i32.const 1) ;; push 1 onto stack
     (br 0) ;; branch back to loop start
     (i32.const 2) ;; this will never be reached
     (br $loop_block) ;; branch to outside block, never reached
    )
   )
  )
 )
 "type mismatch"
)
;; 1. Test a `br_if` within a `loop` construct that branches out of the loop to a block, ensuring that when the branch is taken, function calls are correctly handled and the stack is unwound appropriately. In the wizard_engine, verify that the loop parameters are managed correctly when exiting the loop.

(assert_invalid
  (module
    (func $test-br-if-loop-to-block
      (block $exit
        (loop $continue
          (i32.const 0)  ;; Condition false, no branch
          (br_if $exit)
          (i32.const 1)  ;; Condition true, should exit loop
          (br_if $exit)
          (br $continue)
        )
      )
      (i32.const 1)
      (drop)
    )
  )
  "type mismatch"
)
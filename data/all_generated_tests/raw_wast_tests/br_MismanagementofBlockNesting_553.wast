;; 4. Establish a test case with a `loop` nested within a `block`, and use `br` to jump back to the start of the loop from within a nested block. Focus on verifying if the control flow jumps back correctly and the operand stack is managed. Constraints checked: correct backward branch resolution, stack unwinding.

(assert_invalid
  (module
    (func $test-loop-block-br
      (block
        (loop (result i32)
          (block (result i32)
            (i32.const 42)
            (br 1)
          )
          (i32.const 0)
        )
      )
    )
  )
  "type mismatch"
)
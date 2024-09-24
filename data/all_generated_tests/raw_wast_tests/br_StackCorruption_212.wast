;; 3. Embed a `loop` inside a `block` and branch back to the `loop` beginning. Confirm that the stack height is properly reset, ensuring implementing the correct operand stack management for backward branches. Check for stack corruption indicating mishandled `loop` structure.

(assert_invalid
  (module (func $loop-inside-block-backward-branch
    (block
      (loop
        (br 1)
      )
    )
  ))
  "type mismatch"
)
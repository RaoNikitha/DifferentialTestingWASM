;; 2. Create a nested sequence of `block` and `loop`, where a `br` keyword inside the loop targets the outer block scope. Validate if the operand stack unwinds properly to the block context while ensuring that the correct operand values are restored. Constraints checked: correct target block referencing, stack unwinding.

(assert_invalid
  (module
    (func
      (block
        (loop
          (br 1)
        )
      )
    )
  )
  "type mismatch"
)
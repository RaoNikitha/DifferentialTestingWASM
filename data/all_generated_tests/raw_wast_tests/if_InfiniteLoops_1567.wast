;; 8. **Test Description**:    Loop with multiple nested `if` conditions each branching to a different label:    - Assesses context and label assignment accuracy in nested structures avoiding infinite looping.

(assert_invalid
  (module
    (func $complex-nested-if-loop
      (block $label0
        (loop $label1
          (if (i32.const 1) (then
            (if (i32.const 0) (then
              (br $label1)
            ) (else
              (if (i32.const 1) (then
                (br $label0)
              ) (else
                (br $label1)
              ))
            ))
          ))
        )
      )
    )
  )
  "unreachable code"
)
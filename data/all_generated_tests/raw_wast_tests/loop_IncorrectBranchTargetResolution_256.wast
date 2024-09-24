;; Test 7: Tests where a loop contains multiple `br` instructions branching to different labels inside nested blocks. An incorrect label resolution will compromise the execution sequence and expected outcome.

(assert_invalid
  (module (func $label-resolution-multiple-br
    (block
      (loop
        (block $label1
          (block $label2
            br $label1
            br $label2
          )
        )
      )
    )
  ))
  "type mismatch"
)
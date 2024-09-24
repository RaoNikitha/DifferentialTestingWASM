;; Test 6: Construct a test with a `block` containing another `nested block` and an independent `loop`. Use `br` to target the inner block from within the loop. This checks for correct branching across independent nested constructs.

(assert_invalid
  (module
    (func $complex-br-test
      (block
        (block
          (loop
            (br 1)
          )
        )
      )
    )
  )
  "unknown label"
)
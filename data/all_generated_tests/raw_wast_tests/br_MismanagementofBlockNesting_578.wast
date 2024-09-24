;; Test 9: Design a sequence with a `block` nested within another `block`, followed by a `loop`. Use a `br` to jump from inside the inner block to the head of the loop. Test for end-to-beginning jump correctness in mixed constructs.

(assert_invalid
  (module
    (func
      (block
        (block
          (i32.const 0)
          (br 1)
        )
      )
      (loop)
    )
  )
  "type mismatch"
)
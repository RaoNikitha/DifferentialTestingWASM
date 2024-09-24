;; 4. **Test 4: Loop Within If Block Misbranching**    - A loop nested inside an `if` block where branches within the loop erroneously target parts of the enclosing `if` block.

(assert_invalid
  (module
    (func $loop-within-if-block-misbranching (result i32)
      (if (result i32) (i32.const 1)
        (then
          (loop $inner_loop
            (br_if 1 (i32.const 0))  ; Erroneously branch out to if block
            (br 0)
          )
          (i32.const 1)
        )
      )
    )
  )
  "invalid branch"
)
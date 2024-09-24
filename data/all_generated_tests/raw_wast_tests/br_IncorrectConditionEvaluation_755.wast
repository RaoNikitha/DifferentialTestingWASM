;; Test 6: Create a module with a `loop` containing a `br_if` instruction. The `br_if` should branch if a running counter is less than a threshold. Test the counter exceeding the threshold to ensure it does not branch mistakenly, checking for less than condition accuracy.

(assert_invalid
  (module
    (func $br_if_less_than
      (loop
        (block
          (i32.const 5)
          (i32.const 10)
          (i32.lt_s)
          (br_if 1)
        )
        (br 1)
      )
    )
  )
  "type mismatch"
)
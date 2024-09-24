;; 6. Create a `loop` where a `br_if` depends on stack modifications (pushing/popping) before `return`. Test if mismatches in stack operations lead to infinite loops due to improper exits.

(assert_invalid
  (module
    (func $loop_with_br_if_and_return
      (result i32)
      (local $i i32)
      (loop $loop
        (local.set $i
          (i32.add
            (local.get $i)
            (i32.const 1)
          )
        )
        (br_if $loop
          (i32.lt_s
            (local.get $i)
            (i32.const 10)
          )
        )
        (return
          (i32.const 42)
        )
      )
    )
  )
  "type mismatch"
)
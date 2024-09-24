;; 4. Construct a loop with a `br_if` where the condition checks for an element that is conditionally removed from the stack, ensuring improper stack operations prevent loop termination.

(assert_invalid
  (module 
    (func $test (param $p i32) (result i32)
      (local $l i32)
      (block $exit
        (loop $loop (result i32)
          (local.set $l (i32.const 10))
          (local.get $l)
          (local.get $p)
          (i32.sub)
          (local.set $l)
          (local.get $l)
          (i32.const 0)
          (i32.eq)
          (br_if $exit)
          (br $loop)
        )
      )
    )
  )
  "type mismatch"
)
;; 9. Design a loop that contains a conditional branch `br_if` using a local variable that is the result of an arithmetic operation (e.g., a modulo operation). This will test the loop’s condition evaluation when dependent on arithmetic results.

(assert_invalid
  (module
    (func $complex-loop
      (local $x i32)
      (local.set $x (i32.const 10))
      (loop (result i32)
        (local.get $x)
        (i32.const 3)
        (i32.rem_s)
        (br_if 0 (local.get $x))
      )
    )
  )
  "type mismatch"
)
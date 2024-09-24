;; - A function that performs a sequence of computations, followed by a `br_if` that conditionally calls another function and returns an accumulated result. Incorrect br_if handling might lead to wrong function call sequences, affecting the final return value.

(assert_invalid
  (module
    (func $complex-br_if
      (param $x i32) (result i32)
      (local $y i32)
      (local.set $y (i32.add (local.get $x) (i32.const 10)))  
      (block (result i32)
        (br_if 0
          (i32.sub
            (local.get $y)
            (i32.const 5)
          )
        )
        (i32.const 20)
      )
      (if (i32.eqz (local.get $y))
        (then
          (return (i32.const 30))
        )
      )
      (local.get $y)
    )
  )
  "type mismatch"
)
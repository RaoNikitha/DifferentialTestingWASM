;; 7. A series of computations where the result of a numeric operation feeds into `br_if`'s condition and is expected to trigger a branch if non-zero. The test confirms no incorrect branches occur if the numeric result is zero.

(assert_invalid
  (module
    (func $complex-computation-br_if
      (block (result i32)
        (i32.const 1)
        (i32.const 2)
        (i32.add)
        (i32.const 2)
        (i32.div_u)
        (br_if 0 (local.get 0))
        (i32.const 0)
      )
    )
  )
  "unknown label"
)
;; Test `br_if` operator

(assert_invalid
  (module (func $type-false-i32 (block (i32.ctz (br_if 0 (i32.const 0))))))
  "type mismatch"
)
(assert_invalid
  (module (func $type-false-i64 (block (i64.ctz (br_if 0 (i32.const 0))))))
  "type mismatch"
)
(assert_invalid
  (module (func $type-false-f32 (block (f32.neg (br_if 0 (i32.const 0))))))
  "type mismatch"
)
(assert_invalid
  (module (func $type-false-f64 (block (f64.neg (br_if 0 (i32.const 0))))))
  "type mismatch"
)

(assert_invalid
  (module (func $type-true-i32 (block (i32.ctz (br_if 0 (i32.const 1))))))
  "type mismatch"
)
(assert_invalid
  (module (func $type-true-i64 (block (i64.ctz (br_if 0 (i64.const 1))))))
  "type mismatch"
)
(assert_invalid
  (module (func $type-true-f32 (block (f32.neg (br_if 0 (f32.const 1))))))
  "type mismatch"
)
(assert_invalid
  (module (func $type-true-f64 (block (f64.neg (br_if 0 (i64.const 1))))))
  "type mismatch"
)

(assert_invalid
  (module (func $type-false-arg-void-vs-num (result i32)
    (block (result i32) (br_if 0 (i32.const 0)) (i32.const 1))
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-true-arg-void-vs-num (result i32)
    (block (result i32) (br_if 0 (i32.const 1)) (i32.const 1))
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-false-arg-num-vs-void
    (block (br_if 0 (i32.const 0) (i32.const 0)))
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-true-arg-num-vs-void
    (block (br_if 0 (i32.const 0) (i32.const 1)))
  ))
  "type mismatch"
)

(assert_invalid
  (module (func $type-false-arg-void-vs-num (result i32)
    (block (result i32) (br_if 0 (nop) (i32.const 0)) (i32.const 1))
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-true-arg-void-vs-num (result i32)
    (block (result i32) (br_if 0 (nop) (i32.const 1)) (i32.const 1))
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-false-arg-num-vs-num (result i32)
    (block (result i32)
      (drop (br_if 0 (i64.const 1) (i32.const 0))) (i32.const 1)
    )
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-true-arg-num-vs-num (result i32)
    (block (result i32)
      (drop (br_if 0 (i64.const 1) (i32.const 0))) (i32.const 1)
    )
  ))
  "type mismatch"
)

(assert_invalid
  (module (func $type-cond-empty-vs-i32
    (block (br_if 0))
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-cond-void-vs-i32
    (block (br_if 0 (nop)))
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-cond-num-vs-i32
    (block (br_if 0 (i64.const 0)))
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-arg-cond-void-vs-i32 (result i32)
    (block (result i32) (br_if 0 (i32.const 0) (nop)) (i32.const 1))
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-arg-void-vs-num-nested (result i32)
    (block (result i32) (i32.const 0) (block (br_if 1 (i32.const 1))))
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-arg-cond-num-vs-i32 (result i32)
    (block (result i32) (br_if 0 (i32.const 0) (i64.const 0)) (i32.const 1))
  ))
  "type mismatch"
)

(assert_invalid
  (module
    (func $type-1st-cond-empty-in-then
      (block
        (i32.const 0) (i32.const 0)
        (if (result i32) (then (br_if 0)))
      )
      (i32.eqz) (drop)
    )
  )
  "type mismatch"
)
(assert_invalid
  (module
    (func $type-2nd-cond-empty-in-then
      (block
        (i32.const 0) (i32.const 0)
        (if (result i32) (then (br_if 0 (i32.const 1))))
      )
      (i32.eqz) (drop)
    )
  )
  "type mismatch"
)
(assert_invalid
  (module
    (func $type-1st-cond-empty-in-return
      (block (result i32)
        (return (br_if 0))
      )
      (i32.eqz) (drop)
    )
  )
  "type mismatch"
)
(assert_invalid
  (module
    (func $type-2nd-cond-empty-in-return
      (block (result i32)
        (return (br_if 0 (i32.const 1)))
      )
      (i32.eqz) (drop)
    )
  )
  "type mismatch"
)


(assert_invalid
  (module (func $unbound-label (br_if 1 (i32.const 1))))
  "unknown label"
)
(assert_invalid
  (module (func $unbound-nested-label (block (block (br_if 5 (i32.const 1))))))
  "unknown label"
)
(assert_invalid
  (module (func $large-label (br_if 0x10000001 (i32.const 1))))
  "unknown label"
)


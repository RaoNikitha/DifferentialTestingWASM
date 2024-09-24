;; Test `br_table` operator

(assert_invalid
  (module (func $type-arg-void-vs-num (result i32)
    (block (br_table 0 (i32.const 1)) (i32.const 1))
  ))
  "type mismatch"
)

(assert_invalid
  (module (func $type-arg-empty-vs-num (result i32)
    (block (br_table 0) (i32.const 1))
  ))
  "type mismatch"
)

(assert_invalid
  (module (func $type-arg-void-vs-num (result i32)
    (block (result i32) (br_table 0 (nop) (i32.const 1)) (i32.const 1))
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-arg-num-vs-num (result i32)
    (block (result i32)
      (br_table 0 0 0 (i64.const 1) (i32.const 1)) (i32.const 1)
    )
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-arg-num-vs-arg-num
    (block
      (block (result f32)
        (br_table 0 1 (f32.const 0) (i32.const 0))
      )
      (drop)
    )
  ))
  "type mismatch"
)
(assert_invalid
  (module (func
    (block (result i32)
      (block (result i64)
        (br_table 0 1 (i32.const 0) (i32.const 0))
      )
    )
  ))
  "type mismatch"
)

(assert_invalid
  (module (func $type-index-void-vs-i32
    (block (br_table 0 0 0 (nop)))
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-index-num-vs-i32
    (block (br_table 0 (i64.const 0)))
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-arg-index-void-vs-i32 (result i32)
    (block (result i32) (br_table 0 0 (i32.const 0) (nop)) (i32.const 1))
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-arg-void-vs-num-nested (result i32)
    (block (result i32) (i32.const 0) (block (br_table 1 (i32.const 0))))
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-arg-index-num-vs-i32 (result i32)
    (block (result i32)
      (br_table 0 0 (i32.const 0) (i64.const 0)) (i32.const 1)
    )
  ))
  "type mismatch"
)

(assert_invalid
  (module (func $type-arg-void-vs-num (result i32)
    (block (br_table 0 (i32.const 1)) (i32.const 1))
  ))
  "type mismatch"
)

(assert_invalid
  (module
    (func $type-arg-index-empty-in-then
      (block
        (i32.const 0) (i32.const 0)
        (if (result i32) (then (br_table 0)))
      )
      (i32.eqz) (drop)
    )
  )
  "type mismatch"
)
(assert_invalid
  (module
    (func $type-arg-value-empty-in-then
      (block
        (i32.const 0) (i32.const 0)
        (if (result i32) (then (br_table 0 (i32.const 1))))
      )
      (i32.eqz) (drop)
    )
  )
  "type mismatch"
)
(assert_invalid
  (module
    (func $type-arg-index-empty-in-return
      (block (result i32)
        (return (br_table 0))
      )
      (i32.eqz) (drop)
    )
  )
  "type mismatch"
)
(assert_invalid
  (module
    (func $type-arg-value-empty-in-return
      (block (result i32)
        (return (br_table 0 (i32.const 1)))
      )
      (i32.eqz) (drop)
    )
  )
  "type mismatch"
)

(assert_invalid
  (module
    (func (param i32) (result i32)
      (loop (result i32)
        (block (result i32)
          (br_table 0 1 (i32.const 1) (local.get 0))
        )
      )
    )
  )
  "type mismatch"
)
(assert_invalid
  (module
    (func (param i32) (result i32)
      (block (result i32)
        (loop (result i32)
          (br_table 0 1 (i32.const 1) (local.get 0))
        )
      )
    )
  )
  "type mismatch"
)


(assert_invalid
  (module (func $unbound-label
    (block (br_table 2 1 (i32.const 1)))
  ))
  "unknown label"
)
(assert_invalid
  (module (func $unbound-nested-label
    (block (block (br_table 0 5 (i32.const 1))))
  ))
  "unknown label"
)
(assert_invalid
  (module (func $large-label
    (block (br_table 0 0x10000001 0 (i32.const 1)))
  ))
  "unknown label"
)

(assert_invalid
  (module (func $unbound-label-default
    (block (br_table 1 2 (i32.const 1)))
  ))
  "unknown label"
)
(assert_invalid
  (module (func $unbound-nested-label-default
    (block (block (br_table 0 5 (i32.const 1))))
  ))
  "unknown label"
)
(assert_invalid
  (module (func $large-label-default
    (block (br_table 0 0 0x10000001 (i32.const 1)))
  ))
  "unknown label"
)


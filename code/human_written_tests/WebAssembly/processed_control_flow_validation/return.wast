;; Test `return` operator

(assert_invalid
  (module (func $type-value-empty-vs-num (result i32) (return)))
  "type mismatch"
)
(assert_invalid
  (module
    (func $type-value-empty-vs-num-in-block (result i32)
      (i32.const 0)
      (block (return))
    )
  )
  "type mismatch"
)
(assert_invalid
  (module
    (func $type-value-empty-vs-num-in-loop (result i32)
      (i32.const 0)
      (loop (return))
    )
  )
  "type mismatch"
)
(assert_invalid
  (module
    (func $type-value-empty-vs-num-in-then (result i32)
      (i32.const 0) (i32.const 0)
      (if (then (return)))
    )
  )
  "type mismatch"
)
(assert_invalid
  (module
    (func $type-value-empty-vs-num-in-else (result i32)
      (i32.const 0) (i32.const 0)
      (if (result i32) (then (i32.const 0)) (else (return))) (drop)
    )
  )
  "type mismatch"
)
(assert_invalid
  (module
    (func $type-value-empty-vs-num-in-br (result i32)
      (i32.const 0)
      (block (br 0 (return)))
    )
  )
  "type mismatch"
)
(assert_invalid
  (module
    (func $type-value-empty-vs-num-in-br_if (result i32)
      (i32.const 0)
      (block (br_if 0 (return) (i32.const 1)))
    )
  )
  "type mismatch"
)
(assert_invalid
  (module
    (func $type-value-empty-vs-num-in-br_table (result i32)
      (i32.const 0)
      (block (br_table 0 (return)))
    )
  )
  "type mismatch"
)
(assert_invalid
  (module
    (func $type-value-empty-vs-num-in-return (result i32)
      (return (return))
    )
  )
  "type mismatch"
)
(assert_invalid
  (module
    (func $type-value-empty-vs-num-in-select (result i32)
      (select (return) (i32.const 1) (i32.const 2))
    )
  )
  "type mismatch"
)
(assert_invalid
  (module
    (func $type-value-empty-vs-num-in-call (result i32)
      (call 1 (return))
    )
    (func (param i32) (result i32) (local.get 0))
  )
  "type mismatch"
)
(assert_invalid
  (module
    (func $f (param i32) (result i32) (local.get 0))
    (type $sig (func (param i32) (result i32)))
    (table funcref (elem $f))
    (func $type-value-empty-vs-num-in-call_indirect (result i32)
      (block (result i32)
        (call_indirect (type $sig)
          (return) (i32.const 0)
        )
      )
    )
  )
  "type mismatch"
)
(assert_invalid
  (module
    (func $type-value-empty-vs-num-in-local.set (result i32)
      (local i32)
      (local.set 0 (return)) (local.get 0)
    )
  )
  "type mismatch"
)
(assert_invalid
  (module
    (func $type-value-empty-vs-num-in-local.tee (result i32)
      (local i32)
      (local.tee 0 (return))
    )
  )
  "type mismatch"
)
(assert_invalid
  (module
    (global $x (mut i32) (i32.const 0))
    (func $type-value-empty-vs-num-in-global.set (result i32)
      (global.set $x (return)) (global.get $x)
    )
  )
  "type mismatch"
)
(assert_invalid
  (module
    (memory 0)
    (func $type-value-empty-vs-num-in-memory.grow (result i32)
      (memory.grow (return))
    )
  )
  "type mismatch"
)
(assert_invalid
  (module
    (memory 0)
    (func $type-value-empty-vs-num-in-load (result i32)
      (i32.load (return))
    )
  )
  "type mismatch"
)
(assert_invalid
  (module
    (memory 1)
    (func $type-value-empty-vs-num-in-store (result i32)
      (i32.store (return) (i32.const 1))
    )
  )
  "type mismatch"
)
(assert_invalid
  (module (func $type-value-void-vs-num (result f64) (return (nop))))
  "type mismatch"
)
(assert_invalid
  (module (func $type-value-num-vs-num (result f64) (return (i64.const 1))))
  "type mismatch"
)


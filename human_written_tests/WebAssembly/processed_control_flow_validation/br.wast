;; Test `br` operator

(assert_invalid
  (module (func $type-arg-empty-vs-num (result i32)
    (block (result i32) (br 0) (i32.const 1))
  ))
  "type mismatch"
)

(assert_invalid
  (module (func $type-arg-void-vs-num (result i32)
    (block (result i32) (br 0 (nop)) (i32.const 1))
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-arg-void-vs-num-nested (result i32)
    (block (result i32) (i32.const 0) (block (br 1)))
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-arg-num-vs-num (result i32)
    (block (result i32) (br 0 (i64.const 1)) (i32.const 1))
  ))
  "type mismatch"
)

(assert_invalid
  (module
    (func $type-arg-empty-in-br
      (i32.const 0)
      (block (result i32) (br 0 (br 0))) (i32.eqz) (drop)
    )
  )
  "type mismatch"
)
(assert_invalid
  (module
    (func $type-arg-empty-in-br_if
      (i32.const 0)
      (block (result i32) (br_if 0 (br 0) (i32.const 1))) (i32.eqz) (drop)
    )
  )
  "type mismatch"
)
(assert_invalid
  (module
    (func $type-arg-empty-in-br_table
      (i32.const 0)
      (block (result i32) (br_table 0 (br 0))) (i32.eqz) (drop)
    )
  )
  "type mismatch"
)
(assert_invalid
  (module
    (func $type-arg-empty-in-return
      (block (result i32)
        (return (br 0))
      )
      (i32.eqz) (drop)
    )
  )
  "type mismatch"
)
(assert_invalid
  (module
    (func $type-arg-empty-in-select
      (block (result i32)
        (select (br 0) (i32.const 1) (i32.const 2))
      )
      (i32.eqz) (drop)
    )
  )
  "type mismatch"
)
(assert_invalid
  (module
    (func $type-arg-empty-in-call
      (block (result i32)
        (call 1 (br 0))
      )
      (i32.eqz) (drop)
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
    (func $type-arg-empty-in-call_indirect
      (block (result i32)
        (call_indirect (type $sig)
          (br 0) (i32.const 0)
        )
      )
      (i32.eqz) (drop)
    )
  )
  "type mismatch"
)
(assert_invalid
  (module
    (func $type-arg-empty-in-local.set
      (local i32)
      (block (result i32)
        (local.set 0 (br 0)) (local.get 0)
      )
      (i32.eqz) (drop)
    )
  )
  "type mismatch"
)
(assert_invalid
  (module
    (func $type-arg-empty-in-local.tee
      (local i32)
      (block (result i32)
        (local.tee 0 (br 0))
      )
      (i32.eqz) (drop)
    )
  )
  "type mismatch"
)
(assert_invalid
  (module
    (global $x (mut i32) (i32.const 0))
    (func $type-arg-empty-in-global.set
      (block (result i32)
        (global.set $x (br 0)) (global.get $x)
      )
      (i32.eqz) (drop)
    )
  )
  "type mismatch"
)
(assert_invalid
  (module
    (memory 0)
    (func $type-arg-empty-in-memory.grow
      (block (result i32)
        (memory.grow (br 0))
      )
      (i32.eqz) (drop)
    )
  )
  "type mismatch"
)
(assert_invalid
  (module
    (memory 1)
    (func $type-arg-empty-in-load
      (block (result i32)
        (i32.load (br 0))
      )
      (i32.eqz) (drop)
    )
  )
  "type mismatch"
)
(assert_invalid
  (module
    (memory 1)
    (func $type-arg-empty-in-store
      (block (result i32)
        (i32.store (br 0) (i32.const 0))
      )
      (i32.eqz) (drop)
    )
  )
  "type mismatch"
)

(assert_invalid
  (module (func $unbound-label (br 1)))
  "unknown label"
)
(assert_invalid
  (module (func $unbound-nested-label (block (block (br 5)))))
  "unknown label"
)
(assert_invalid
  (module (func $large-label (br 0x10000001)))
  "unknown label"
)

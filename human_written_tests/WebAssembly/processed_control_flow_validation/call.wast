;; Test `call` operator

;; Invalid typing

(assert_invalid
  (module
    (func $type-void-vs-num (i32.eqz (call 1)))
    (func)
  )
  "type mismatch"
)
(assert_invalid
  (module
    (func $type-num-vs-num (i32.eqz (call 1)))
    (func (result i64) (i64.const 1))
  )
  "type mismatch"
)

(assert_invalid
  (module
    (func $arity-0-vs-1 (call 1))
    (func (param i32))
  )
  "type mismatch"
)
(assert_invalid
  (module
    (func $arity-0-vs-2 (call 1))
    (func (param f64 i32))
  )
  "type mismatch"
)
(assert_invalid
  (module
    (func $arity-1-vs-0 (call 1 (i32.const 1)))
    (func)
  )
  "type mismatch"
)
(assert_invalid
  (module
    (func $arity-2-vs-0 (call 1 (f64.const 2) (i32.const 1)))
    (func)
  )
  "type mismatch"
)

(assert_invalid
  (module
    (func $type-first-void-vs-num (call 1 (nop) (i32.const 1)))
    (func (param i32 i32))
  )
  "type mismatch"
)
(assert_invalid
  (module
    (func $type-second-void-vs-num (call 1 (i32.const 1) (nop)))
    (func (param i32 i32))
  )
  "type mismatch"
)
(assert_invalid
  (module
    (func $type-first-num-vs-num (call 1 (f64.const 1) (i32.const 1)))
    (func (param i32 f64))
  )
  "type mismatch"
)
(assert_invalid
  (module
    (func $type-second-num-vs-num (call 1 (i32.const 1) (f64.const 1)))
    (func (param f64 i32))
  )
  "type mismatch"
)

(assert_invalid
  (module
    (func $type-first-empty-in-block
      (block (call 1))
    )
    (func (param i32))
  )
  "type mismatch"
)
(assert_invalid
  (module
    (func $type-second-empty-in-block
      (block (call 1 (i32.const 0)))
    )
    (func (param i32 i32))
  )
  "type mismatch"
)
(assert_invalid
  (module
    (func $type-first-empty-in-loop
      (loop (call 1))
    )
    (func (param i32))
  )
  "type mismatch"
)
(assert_invalid
  (module
    (func $type-second-empty-in-loop
      (loop (call 1 (i32.const 0)))
    )
    (func (param i32 i32))
  )
  "type mismatch"
)
(assert_invalid
  (module
    (func $type-first-empty-in-then
      (if (i32.const 0) (then (call 1)))
    )
    (func (param i32))
  )
  "type mismatch"
)
(assert_invalid
  (module
    (func $type-second-empty-in-then
      (if (i32.const 0) (then (call 1 (i32.const 0))))
    )
    (func (param i32 i32))
  )
  "type mismatch"
)


;; Unbound function

(assert_invalid
  (module (func $unbound-func (call 1)))
  "unknown function"
)
(assert_invalid
  (module (func $large-func (call 1012321300)))
  "unknown function"
)

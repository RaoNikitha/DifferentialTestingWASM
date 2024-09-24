;; Test `if` operator

(assert_malformed
  (module quote
    "(type $sig (func (param i32) (result i32)))"
    "(func (i32.const 0)"
    "  (if (type $sig) (result i32) (param i32) (i32.const 1) (then))"
    ")"
  )
  "unexpected token"
)
(assert_malformed
  (module quote
    "(type $sig (func (param i32) (result i32)))"
    "(func (i32.const 0)"
    "  (if (param i32) (type $sig) (result i32) (i32.const 1) (then))"
    ")"
  )
  "unexpected token"
)
(assert_malformed
  (module quote
    "(type $sig (func (param i32) (result i32)))"
    "(func (i32.const 0)"
    "  (if (param i32) (result i32) (type $sig) (i32.const 1) (then))"
    ")"
  )
  "unexpected token"
)
(assert_malformed
  (module quote
    "(type $sig (func (param i32) (result i32)))"
    "(func (i32.const 0)"
    "  (if (result i32) (type $sig) (param i32) (i32.const 1) (then))"
    ")"
  )
  "unexpected token"
)
(assert_malformed
  (module quote
    "(type $sig (func (param i32) (result i32)))"
    "(func (i32.const 0)"
    "  (if (result i32) (param i32) (type $sig) (i32.const 1) (then))"
    ")"
  )
  "unexpected token"
)
(assert_malformed
  (module quote
    "(func (i32.const 0) (if (result i32) (param i32) (i32.const 1) (then)))"
  )
  "unexpected token"
)

(assert_malformed
  (module quote
    "(func (i32.const 0) (i32.const 1)"
    "  (if (param $x i32) (then (drop)) (else (drop)))"
    ")"
  )
  "unexpected token"
)
(assert_malformed
  (module quote
    "(type $sig (func))"
    "(func (i32.const 1)"
    "  (if (type $sig) (result i32) (then (i32.const 0)) (else (i32.const 2)))"
    "  (unreachable)"
    ")"
  )
  "inline function type"
)
(assert_malformed
  (module quote
    "(type $sig (func (param i32) (result i32)))"
    "(func (i32.const 1)"
    "  (if (type $sig) (result i32) (then (i32.const 0)) (else (i32.const 2)))"
    "  (unreachable)"
    ")"
  )
  "inline function type"
)
(assert_malformed
  (module quote
    "(type $sig (func (param i32) (result i32)))"
    "(func (i32.const 0) (i32.const 1)"
    "  (if (type $sig) (param i32) (then (drop)) (else (drop)))"
    "  (unreachable)"
    ")"
  )
  "inline function type"
)
(assert_malformed
  (module quote
    "(type $sig (func (param i32 i32) (result i32)))"
    "(func (i32.const 0) (i32.const 1)"
    "  (if (type $sig) (param i32) (result i32) (then)) (unreachable)"
    ")"
  )
  "inline function type"
)

(assert_invalid
  (module
    (type $sig (func))
    (func (i32.const 1) (if (type $sig) (i32.const 0) (then)))
  )
  "type mismatch"
)

(assert_invalid
  (module (func $type-empty-i32 (result i32) (if (i32.const 0) (then))))
  "type mismatch"
)
(assert_invalid
  (module (func $type-empty-i64 (result i64) (if (i32.const 0) (then))))
  "type mismatch"
)
(assert_invalid
  (module (func $type-empty-f32 (result f32) (if (i32.const 0) (then))))
  "type mismatch"
)
(assert_invalid
  (module (func $type-empty-f64 (result f64) (if (i32.const 0) (then))))
  "type mismatch"
)

(assert_invalid
  (module (func $type-empty-i32 (result i32) (if (i32.const 0) (then) (else))))
  "type mismatch"
)
(assert_invalid
  (module (func $type-empty-i64 (result i64) (if (i32.const 0) (then) (else))))
  "type mismatch"
)
(assert_invalid
  (module (func $type-empty-f32 (result f32) (if (i32.const 0) (then) (else))))
  "type mismatch"
)
(assert_invalid
  (module (func $type-empty-f64 (result f64) (if (i32.const 0) (then) (else))))
  "type mismatch"
)

(assert_invalid
  (module (func $type-then-value-num-vs-void
    (if (i32.const 1) (then (i32.const 1)))
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-then-value-num-vs-void-else
    (if (i32.const 1) (then (i32.const 1)) (else))
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-else-value-num-vs-void
    (if (i32.const 1) (then) (else (i32.const 1)))
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-both-value-num-vs-void
    (if (i32.const 1) (then (i32.const 1)) (else (i32.const 1)))
  ))
  "type mismatch"
)

(assert_invalid
  (module (func $type-then-value-nums-vs-void
    (if (i32.const 1) (then (i32.const 1) (i32.const 2)))
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-then-value-nums-vs-void-else
    (if (i32.const 1) (then (i32.const 1) (i32.const 2)) (else))
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-else-value-nums-vs-void
    (if (i32.const 1) (then) (else (i32.const 1) (i32.const 2)))
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-both-value-nums-vs-void
    (if (i32.const 1) (then (i32.const 1) (i32.const 2)) (else (i32.const 2) (i32.const 1)))
  ))
  "type mismatch"
)

(assert_invalid
  (module (func $type-then-value-empty-vs-num (result i32)
    (if (result i32) (i32.const 1) (then) (else (i32.const 0)))
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-else-value-empty-vs-num (result i32)
    (if (result i32) (i32.const 1) (then (i32.const 0)) (else))
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-both-value-empty-vs-num (result i32)
    (if (result i32) (i32.const 1) (then) (else))
  ))
  "type mismatch"
)

(assert_invalid
  (module (func $type-then-value-empty-vs-nums (result i32 i32)
    (if (result i32 i32) (i32.const 1) (then) (else (i32.const 0) (i32.const 2)))
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-else-value-empty-vs-nums (result i32 i32)
    (if (result i32 i32) (i32.const 1) (then (i32.const 0) (i32.const 1)) (else))
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-both-value-empty-vs-nums (result i32 i32)
    (if (result i32 i32) (i32.const 1) (then) (else))
  ))
  "type mismatch"
)

(assert_invalid
  (module (func $type-no-else-vs-num (result i32)
    (if (result i32) (i32.const 1) (then (i32.const 1)))
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-no-else-vs-nums (result i32 i32)
    (if (result i32 i32) (i32.const 1) (then (i32.const 1) (i32.const 1)))
  ))
  "type mismatch"
)

(assert_invalid
  (module (func $type-then-value-void-vs-num (result i32)
    (if (result i32) (i32.const 1) (then (nop)) (else (i32.const 0)))
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-else-value-void-vs-num (result i32)
    (if (result i32) (i32.const 1) (then (i32.const 0)) (else (nop)))
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-both-value-void-vs-num (result i32)
    (if (result i32) (i32.const 1) (then (nop)) (else (nop)))
  ))
  "type mismatch"
)

(assert_invalid
  (module (func $type-then-value-void-vs-nums (result i32 i32)
    (if (result i32 i32) (i32.const 1) (then (nop)) (else (i32.const 0) (i32.const 0)))
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-else-value-void-vs-nums (result i32 i32)
    (if (result i32 i32) (i32.const 1) (then (i32.const 0) (i32.const 0)) (else (nop)))
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-both-value-void-vs-nums (result i32 i32)
    (if (result i32 i32) (i32.const 1) (then (nop)) (else (nop)))
  ))
  "type mismatch"
)

(assert_invalid
  (module (func $type-then-value-num-vs-num (result i32)
    (if (result i32) (i32.const 1) (then (i64.const 1)) (else (i32.const 1)))
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-else-value-num-vs-num (result i32)
    (if (result i32) (i32.const 1) (then (i32.const 1)) (else (i64.const 1)))
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-both-value-num-vs-num (result i32)
    (if (result i32) (i32.const 1) (then (i64.const 1)) (else (i64.const 1)))
  ))
  "type mismatch"
)

(assert_invalid
  (module (func $type-then-value-num-vs-nums (result i32 i32)
    (if (result i32 i32) (i32.const 1) (then (i32.const 1)) (else (i32.const 1) (i32.const 1)))
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-else-value-num-vs-nums (result i32 i32)
    (if (result i32 i32) (i32.const 1) (then (i32.const 1) (i32.const 1)) (else (i32.const 1)))
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-both-value-num-vs-nums (result i32 i32)
    (if (result i32 i32) (i32.const 1) (then (i32.const 1)) (else (i32.const 1)))
  ))
  "type mismatch"
)

(assert_invalid
  (module (func $type-then-value-partial-vs-nums (result i32 i32)
    (i32.const 0)
    (if (result i32 i32) (i32.const 1) (then (i32.const 1)) (else (i32.const 1) (i32.const 1)))
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-else-value-partial-vs-nums (result i32 i32)
    (i32.const 0)
    (if (result i32 i32) (i32.const 1) (then (i32.const 1) (i32.const 1)) (else (i32.const 1)))
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-both-value-partial-vs-nums (result i32 i32)
    (i32.const 0)
    (if (result i32 i32) (i32.const 1) (then (i32.const 1)) (else (i32.const 1)))
  ))
  "type mismatch"
)

(assert_invalid
  (module (func $type-then-value-nums-vs-num (result i32)
    (if (result i32) (i32.const 1) (then (i32.const 1) (i32.const 1)) (else (i32.const 1)))
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-else-value-nums-vs-num (result i32)
    (if (result i32) (i32.const 1) (then (i32.const 1)) (else (i32.const 1) (i32.const 1)))
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-both-value-nums-vs-num (result i32)
    (if (result i32) (i32.const 1) (then (i32.const 1) (i32.const 1)) (else (i32.const 1) (i32.const 1)))
  ))
  "type mismatch"
)

(assert_invalid
  (module (func $type-both-different-value-num-vs-num (result i32)
    (if (result i32) (i32.const 1) (then (i64.const 1)) (else (f64.const 1)))
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-both-different-value-nums-vs-nums (result i32 i32)
    (if (result i32 i32) (i32.const 1) (then (i32.const 1) (i32.const 1) (i32.const 1)) (else (i32.const 1)))
  ))
  "type mismatch"
)

(assert_invalid
  (module (func $type-then-value-unreached-select (result i32)
    (if (result i64)
      (i32.const 0)
      (then (select (unreachable) (unreachable) (unreachable)))
      (else (i64.const 0))
    )
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-else-value-unreached-select (result i32)
    (if (result i64)
      (i32.const 1)
      (then (i64.const 0))
      (else (select (unreachable) (unreachable) (unreachable)))
    )
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-else-value-unreached-select (result i32)
    (if (result i64)
      (i32.const 1)
      (then (select (unreachable) (unreachable) (unreachable)))
      (else (select (unreachable) (unreachable) (unreachable)))
    )
  ))
  "type mismatch"
)

(assert_invalid
  (module (func $type-then-break-last-void-vs-num (result i32)
    (if (result i32) (i32.const 1) (then (br 0)) (else (i32.const 1)))
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-else-break-last-void-vs-num (result i32)
    (if (result i32) (i32.const 1) (then (i32.const 1)) (else (br 0)))
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-then-break-last-void-vs-nums (result i32 i32)
    (if (result i32 i32) (i32.const 1) (then (br 0)) (else (i32.const 1) (i32.const 1)))
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-else-break-last-void-vs-nums (result i32 i32)
    (if (result i32 i32) (i32.const 1) (then (i32.const 1) (i32.const 1)) (else (br 0)))
  ))
  "type mismatch"
)

(assert_invalid
  (module (func $type-then-break-empty-vs-num (result i32)
    (if (result i32) (i32.const 1)
      (then (br 0) (i32.const 1))
      (else (i32.const 1))
    )
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-else-break-empty-vs-num (result i32)
    (if (result i32) (i32.const 1)
      (then (i32.const 1))
      (else (br 0) (i32.const 1))
    )
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-then-break-empty-vs-nums (result i32 i32)
    (if (result i32 i32) (i32.const 1)
      (then (br 0) (i32.const 1) (i32.const 1))
      (else (i32.const 1) (i32.const 1))
    )
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-else-break-empty-vs-nums (result i32 i32)
    (if (result i32 i32) (i32.const 1)
      (then (i32.const 1) (i32.const 1))
      (else (br 0) (i32.const 1) (i32.const 1))
    )
  ))
  "type mismatch"
)

(assert_invalid
  (module (func $type-then-break-void-vs-num (result i32)
    (if (result i32) (i32.const 1)
      (then (br 0 (nop)) (i32.const 1))
      (else (i32.const 1))
    )
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-else-break-void-vs-num (result i32)
    (if (result i32) (i32.const 1)
      (then (i32.const 1))
      (else (br 0 (nop)) (i32.const 1))
    )
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-then-break-void-vs-nums (result i32 i32)
    (if (result i32 i32) (i32.const 1)
      (then (br 0 (nop)) (i32.const 1) (i32.const 1))
      (else (i32.const 1) (i32.const 1))
    )
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-else-break-void-vs-nums (result i32 i32)
    (if (result i32 i32) (i32.const 1)
      (then (i32.const 1) (i32.const 1))
      (else (br 0 (nop)) (i32.const 1) (i32.const 1))
    )
  ))
  "type mismatch"
)

(assert_invalid
  (module (func $type-then-break-num-vs-num (result i32)
    (if (result i32) (i32.const 1)
      (then (br 0 (i64.const 1)) (i32.const 1))
      (else (i32.const 1))
    )
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-else-break-num-vs-num (result i32)
    (if (result i32) (i32.const 1)
      (then (i32.const 1))
      (else (br 0 (i64.const 1)) (i32.const 1))
    )
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-then-break-num-vs-nums (result i32 i32)
    (if (result i32 i32) (i32.const 1)
      (then (br 0 (i64.const 1)) (i32.const 1) (i32.const 1))
      (else (i32.const 1) (i32.const 1))
    )
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-else-break-num-vs-nums (result i32 i32)
    (if (result i32 i32) (i32.const 1)
      (then (i32.const 1) (i32.const 1))
      (else (br 0 (i64.const 1)) (i32.const 1) (i32.const 1))
    )
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-then-break-partial-vs-nums (result i32 i32)
    (i32.const 1)
    (if (result i32 i32) (i32.const 1)
      (then (br 0 (i64.const 1)) (i32.const 1))
      (else (i32.const 1))
    )
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-else-break-partial-vs-nums (result i32 i32)
    (i32.const 1)
    (if (result i32 i32) (i32.const 1)
      (then (i32.const 1))
      (else (br 0 (i64.const 1)) (i32.const 1))
    )
  ))
  "type mismatch"
)

(assert_invalid
  (module
    (func $type-condition-empty
      (if (then))
    )
  )
  "type mismatch"
)
(assert_invalid
  (module
    (func $type-condition-empty-in-block
      (i32.const 0)
      (block (if (then)))
    )
  )
  "type mismatch"
)
(assert_invalid
  (module
    (func $type-condition-empty-in-loop
      (i32.const 0)
      (loop (if (then)))
    )
  )
  "type mismatch"
)
(assert_invalid
  (module
    (func $type-condition-empty-in-then
      (i32.const 0) (i32.const 0)
      (if (then (if (then))))
    )
  )
  "type mismatch"
)
(assert_invalid
  (module
    (func $type-condition-empty-in-else
      (i32.const 0) (i32.const 0)
      (if (result i32) (then (i32.const 0)) (else (if (then)) (i32.const 0)))
      (drop)
    )
  )
  "type mismatch"
)
(assert_invalid
  (module
    (func $type-condition-empty-in-br
      (i32.const 0)
      (block (br 0 (if(then))) (drop))
    )
  )
  "type mismatch"
)
(assert_invalid
  (module
    (func $type-condition-empty-in-br_if
      (i32.const 0)
      (block (br_if 0 (if(then)) (i32.const 1)) (drop))
    )
  )
  "type mismatch"
)
(assert_invalid
  (module
    (func $type-condition-empty-in-br_table
      (i32.const 0)
      (block (br_table 0 (if(then))) (drop))
    )
  )
  "type mismatch"
)
(assert_invalid
  (module
    (func $type-condition-empty-in-return
      (return (if(then))) (drop)
    )
  )
  "type mismatch"
)
(assert_invalid
  (module
    (func $type-condition-empty-in-select
      (select (if(then)) (i32.const 1) (i32.const 2)) (drop)
    )
  )
  "type mismatch"
)
(assert_invalid
  (module
    (func $type-condition-empty-in-call
      (call 1 (if(then))) (drop)
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
    (func $type-condition-empty-in-call_indirect
      (block (result i32)
        (call_indirect (type $sig)
          (if(then)) (i32.const 0)
        )
        (drop)
      )
    )
  )
  "type mismatch"
)
(assert_invalid
  (module
    (func $type-condition-empty-in-local.set
      (local i32)
      (local.set 0 (if(then))) (local.get 0) (drop)
    )
  )
  "type mismatch"
)
(assert_invalid
  (module
    (func $type-condition-empty-in-local.tee
      (local i32)
      (local.tee 0 (if(then))) (drop)
    )
  )
  "type mismatch"
)
(assert_invalid
  (module
    (global $x (mut i32) (i32.const 0))
    (func $type-condition-empty-in-global.set
      (global.set $x (if(then))) (global.get $x) (drop)
    )
  )
  "type mismatch"
)
(assert_invalid
  (module
    (memory 0)
    (func $type-condition-empty-in-memory.grow
      (memory.grow (if(then))) (drop)
    )
  )
  "type mismatch"
)
(assert_invalid
  (module
    (memory 0)
    (func $type-condition-empty-in-load
      (i32.load (if(then))) (drop)
    )
  )
  "type mismatch"
)
(assert_invalid
  (module
    (memory 1)
    (func $type-condition-empty-in-store
      (i32.store (if(then)) (i32.const 1))
    )
  )
  "type mismatch"
)

(assert_invalid
  (module (func $type-param-void-vs-num
    (if (param i32) (i32.const 1) (then (drop)))
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-param-void-vs-nums
    (if (param i32 f64) (i32.const 1) (then (drop) (drop)))
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-param-num-vs-num
    (f32.const 0) (if (param i32) (i32.const 1) (then (drop)))
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-param-num-vs-nums
    (f32.const 0) (if (param f32 i32) (i32.const 1) (then (drop) (drop)))
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-param-nested-void-vs-num
    (block (if (param i32) (i32.const 1) (then (drop))))
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-param-void-vs-nums
    (block (if (param i32 f64) (i32.const 1) (then (drop) (drop))))
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-param-num-vs-num
    (block (f32.const 0) (if (param i32) (i32.const 1) (then (drop))))
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-param-num-vs-nums
    (block (f32.const 0) (if (param f32 i32) (i32.const 1) (then (drop) (drop))))
  ))
  "type mismatch"
)

(assert_malformed
  (module quote "(func (param i32) (result i32) if (param $x i32) end)")
  "unexpected token"
)
(assert_malformed
  (module quote "(func (param i32) (result i32) (if (param $x i32) (then)))")
  "unexpected token"
)

(assert_malformed
  (module quote "(func i32.const 0 if end $l)")
  "mismatching label"
)
(assert_malformed
  (module quote "(func i32.const 0 if $a end $l)")
  "mismatching label"
)
(assert_malformed
  (module quote "(func i32.const 0 if else $l end)")
  "mismatching label"
)
(assert_malformed
  (module quote "(func i32.const 0 if $a else $l end)")
  "mismatching label"
)
(assert_malformed
  (module quote "(func i32.const 0 if else end $l)")
  "mismatching label"
)
(assert_malformed
  (module quote "(func i32.const 0 if else $l end $l)")
  "mismatching label"
)
(assert_malformed
  (module quote "(func i32.const 0 if else $l1 end $l2)")
  "mismatching label"
)
(assert_malformed
  (module quote "(func i32.const 0 if $a else end $l)")
  "mismatching label"
)
(assert_malformed
  (module quote "(func i32.const 0 if $a else $a end $l)")
  "mismatching label"
)
(assert_malformed
  (module quote "(func i32.const 0 if $a else $l end $l)")
  "mismatching label"
)
(assert_malformed
  (module quote "(func (if i32.const 0 (then) (else)))")
  "unexpected token"
)
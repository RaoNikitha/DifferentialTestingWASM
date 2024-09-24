;; Test `block` operator

(assert_malformed
  (module quote
    "(type $sig (func (param i32) (result i32)))"
    "(func (i32.const 0) (block (type $sig) (result i32) (param i32)))"
  )
  "unexpected token"
)
(assert_malformed
  (module quote
    "(type $sig (func (param i32) (result i32)))"
    "(func (i32.const 0) (block (param i32) (type $sig) (result i32)))"
  )
  "unexpected token"
)
(assert_malformed
  (module quote
    "(type $sig (func (param i32) (result i32)))"
    "(func (i32.const 0) (block (param i32) (result i32) (type $sig)))"
  )
  "unexpected token"
)
(assert_malformed
  (module quote
    "(type $sig (func (param i32) (result i32)))"
    "(func (i32.const 0) (block (result i32) (type $sig) (param i32)))"
  )
  "unexpected token"
)
(assert_malformed
  (module quote
    "(type $sig (func (param i32) (result i32)))"
    "(func (i32.const 0) (block (result i32) (param i32) (type $sig)))"
  )
  "unexpected token"
)
(assert_malformed
  (module quote
    "(func (i32.const 0) (block (result i32) (param i32)))"
  )
  "unexpected token"
)

(assert_malformed
  (module quote "(func (i32.const 0) (block (param $x i32) (drop)))")
  "unexpected token"
)
(assert_malformed
  (module quote
    "(type $sig (func))"
    "(func (block (type $sig) (result i32) (i32.const 0)) (unreachable))"
  )
  "inline function type"
)
(assert_malformed
  (module quote
    "(type $sig (func (param i32) (result i32)))"
    "(func (block (type $sig) (result i32) (i32.const 0)) (unreachable))"
  )
  "inline function type"
)
(assert_malformed
  (module quote
    "(type $sig (func (param i32) (result i32)))"
    "(func (i32.const 0) (block (type $sig) (param i32) (drop)) (unreachable))"
  )
  "inline function type"
)
(assert_malformed
  (module quote
    "(type $sig (func (param i32 i32) (result i32)))"
    "(func (i32.const 0) (block (type $sig) (param i32) (result i32)) (unreachable))"
  )
  "inline function type"
)

(assert_invalid
  (module
    (type $sig (func))
    (func (block (type $sig) (i32.const 0)))
  )
  "type mismatch"
)

(assert_invalid
  (module (func $type-empty-i32 (result i32) (block)))
  "type mismatch"
)
(assert_invalid
  (module (func $type-empty-i64 (result i64) (block)))
  "type mismatch"
)
(assert_invalid
  (module (func $type-empty-f32 (result f32) (block)))
  "type mismatch"
)
(assert_invalid
  (module (func $type-empty-f64 (result f64) (block)))
  "type mismatch"
)

(assert_invalid
  (module (func $type-value-i32-vs-void
    (block (i32.const 1))
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-value-i64-vs-void
    (block (i64.const 1))
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-value-f32-vs-void
    (block (f32.const 1.0))
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-value-f64-vs-void
    (block (f64.const 1.0))
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-value-nums-vs-void
    (block (i32.const 1) (i32.const 2))
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-value-empty-vs-i32 (result i32)
    (block (result i32))
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-value-empty-vs-i64 (result i64)
    (block (result i64))
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-value-empty-vs-f32 (result f32)
    (block (result f32))
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-value-empty-vs-f64 (result f64)
    (block (result f64))
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-value-empty-vs-nums (result i32 i32)
    (block (result i32 i32))
  ))
  "type mismatch"
)

(assert_invalid
  (module
    (func $type-value-empty-in-block
      (i32.const 0)
      (block (block (result i32)) (drop))
    )
  )
  "type mismatch"
)
(assert_invalid
  (module
    (func $type-value-empty-in-loop
      (i32.const 0)
      (loop (block (result i32)) (drop))
    )
  )
  "type mismatch"
)
(assert_invalid
  (module
    (func $type-value-empty-in-then
      (i32.const 0) (i32.const 0)
      (if (then (block (result i32)) (drop)))
    )
  )
  "type mismatch"
)

(assert_invalid
  (module (func $type-value-void-vs-i32 (result i32)
    (block (result i32) (nop))
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-value-void-vs-i64 (result i64)
    (block (result i64) (nop))
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-value-void-vs-f32 (result f32)
    (block (result f32) (nop))
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-value-void-vs-f64 (result f64)
    (block (result f64) (nop))
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-value-void-vs-nums (result i32 i32)
    (block (result i32 i32) (nop))
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-value-i32-vs-i64 (result i32)
    (block (result i32) (i64.const 0))
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-value-i32-vs-f32 (result i32)
    (block (result i32) (f32.const 0.0))
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-value-i32-vs-f64 (result i32)
    (block (result i32) (f64.const 0.0))
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-value-i64-vs-i32 (result i64)
    (block (result i64) (i32.const 0))
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-value-i64-vs-f32 (result i64)
    (block (result i64) (f32.const 0.0))
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-value-i64-vs-f64 (result i64)
    (block (result i64) (f64.const 0.0))
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-value-f32-vs-i32 (result f32)
    (block (result f32) (i32.const 0))
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-value-f32-vs-i64 (result f32)
    (block (result f32) (i64.const 0))
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-value-f32-vs-f64 (result f32)
    (block (result f32) (f64.const 0.0))
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-value-f64-vs-i32 (result f64)
    (block (result f64) (i32.const 0))
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-value-f64-vs-i64 (result f64)
    (block (result f64) (i64.const 0))
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-value-f64-vs-f32 (result f32)
    (block (result f64) (f32.const 0.0))
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-value-num-vs-nums (result i32 i32)
    (block (result i32 i32) (i32.const 0))
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-value-partial-vs-nums (result i32 i32)
    (i32.const 1) (block (result i32 i32) (i32.const 2))
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-value-nums-vs-num (result i32)
    (block (result i32) (i32.const 1) (i32.const 2))
  ))
  "type mismatch"
)

(assert_invalid
  (module (func $type-value-unreached-select-i32-i64 (result i32)
    (block (result i64) (select (unreachable) (unreachable) (unreachable)))
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-value-unreached-select-i32-f32 (result i32)
    (block (result f32) (select (unreachable) (unreachable) (unreachable)))
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-value-unreached-select-i32-f64 (result i32)
    (block (result f64) (select (unreachable) (unreachable) (unreachable)))
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-value-unreached-select-i64-i32 (result i64)
    (block (result i32) (select (unreachable) (unreachable) (unreachable)))
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-value-unreached-select-i64-f32 (result i64)
    (block (result f32) (select (unreachable) (unreachable) (unreachable)))
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-value-unreached-select-i64-f64 (result i64)
    (block (result f64) (select (unreachable) (unreachable) (unreachable)))
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-value-unreached-select-f32-i32 (result f32)
    (block (result i32) (select (unreachable) (unreachable) (unreachable)))
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-value-unreached-select-f32-i64 (result f32)
    (block (result i64) (select (unreachable) (unreachable) (unreachable)))
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-value-unreached-select-f32-f64 (result f32)
    (block (result f64) (select (unreachable) (unreachable) (unreachable)))
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-value-unreached-select-f64-i32 (result f64)
    (block (result i32) (select (unreachable) (unreachable) (unreachable)))
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-value-unreached-select-f64-i64 (result f64)
    (block (result i64) (select (unreachable) (unreachable) (unreachable)))
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-value-unreached-select-f64-f32 (result f64)
    (block (result f32) (select (unreachable) (unreachable) (unreachable)))
  ))
  "type mismatch"
)

(assert_invalid
  (module (func $type-break-last-void-vs-i32 (result i32)
    (block (result i32) (br 0))
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-break-last-void-vs-i64 (result i64)
    (block (result i64) (br 0))
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-break-last-void-vs-f32 (result f32)
    (block (result f32) (br 0))
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-break-last-void-vs-f64 (result f64)
    (block (result f64) (br 0))
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-break-last-void-vs-nums (result i32 i32)
    (block (result i32 i32) (br 0))
  ))
  "type mismatch"
)

(assert_invalid
  (module (func $type-break-empty-vs-i32 (result i32)
    (block (result i32) (br 0) (i32.const 1))
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-break-empty-vs-i64 (result i64)
    (block (result i64) (br 0) (i64.const 1))
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-break-empty-vs-f32 (result f32)
    (block (result f32) (br 0) (f32.const 1.0))
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-break-empty-vs-f64 (result f64)
    (block (result f64) (br 0) (f64.const 1.0))
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-break-empty-vs-nums (result i32 i32)
    (block (result i32 i32) (br 0) (i32.const 1) (i32.const 2))
  ))
  "type mismatch"
)

(assert_invalid
  (module (func $type-break-void-vs-i32 (result i32)
    (block (result i32) (br 0 (nop)) (i32.const 1))
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-break-void-vs-i64 (result i64)
    (block (result i64) (br 0 (nop)) (i64.const 1))
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-break-void-vs-f32 (result f32)
    (block (result f32) (br 0 (nop)) (f32.const 1.0))
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-break-void-vs-f64 (result f64)
    (block (result f64) (br 0 (nop)) (f64.const 1.0))
  ))
  "type mismatch"
)

(assert_invalid
  (module (func $type-break-i32-vs-i64 (result i32)
    (block (result i32) (br 0 (i64.const 1)) (i32.const 1))
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-break-i32-vs-f32 (result i32)
    (block (result i32) (br 0 (f32.const 1.0)) (i32.const 1))
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-break-i32-vs-f64 (result i32)
    (block (result i32) (br 0 (f64.const 1.0)) (i32.const 1))
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-break-i64-vs-i32 (result i64)
    (block (result i64) (br 0 (i32.const 1)) (i64.const 1))
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-break-i64-vs-f32 (result i64)
    (block (result i64) (br 0 (f32.const 1.0)) (i64.const 1))
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-break-i64-vs-f64 (result i64)
    (block (result i64) (br 0 (f64.const 1.0)) (i64.const 1))
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-break-f32-vs-i32 (result f32)
    (block (result f32) (br 0 (i32.const 1)) (f32.const 1.0))
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-break-f32-vs-i64 (result f32)
    (block (result f32) (br 0 (i64.const 1)) (f32.const 1.0))
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-break-f32-vs-f64 (result f32)
    (block (result f32) (br 0 (f64.const 1.0)) (f32.const 1.0))
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-break-f64-vs-i32 (result f64)
    (block (result i64) (br 0 (i32.const 1)) (f64.const 1.0))
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-break-f64-vs-i64 (result f64)
    (block (result f64) (br 0 (i64.const 1)) (f64.const 1.0))
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-break-f64-vs-f32 (result f64)
    (block (result f64) (br 0 (f32.const 1.0)) (f64.const 1))
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-break-num-vs-nums (result i32 i32)
    (block (result i32 i32) (br 0 (i32.const 0)) (i32.const 1) (i32.const 2))
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-break-partial-vs-nums (result i32 i32)
    (i32.const 1) (block (result i32 i32) (br 0 (i32.const 0)) (i32.const 2))
  ))
  "type mismatch"
)

(assert_invalid
  (module (func $type-break-first-void-vs-i32 (result i32)
    (block (result i32) (br 0 (nop)) (br 0 (i32.const 1)))
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-break-first-void-vs-i64 (result i64)
    (block (result i64) (br 0 (nop)) (br 0 (i64.const 1)))
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-break-first-void-vs-f32 (result f32)
    (block (result f32) (br 0 (nop)) (br 0 (f32.const 1.0)))
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-break-first-void-vs-f64 (result f64)
    (block (result f64) (br 0 (nop)) (br 0 (f64.const 1.0)))
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-break-first-void-vs-nums (result i32 i32)
    (block (result i32 i32) (br 0 (nop)) (br 0 (i32.const 1) (i32.const 2)))
  ))
  "type mismatch"
)

(assert_invalid
  (module (func $type-break-first-i32-vs-i64 (result i32)
    (block (result i32) (br 0 (i64.const 1)) (br 0 (i32.const 1)))
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-break-first-i32-vs-f32 (result i32)
    (block (result i32) (br 0 (f32.const 1.0)) (br 0 (i32.const 1)))
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-break-first-i32-vs-f64 (result i32)
    (block (result i32) (br 0 (f64.const 1.0)) (br 0 (i32.const 1)))
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-break-first-i64-vs-i32 (result i64)
    (block (result i64) (br 0 (i32.const 1)) (br 0 (i64.const 1)))
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-break-first-i64-vs-f32 (result i64)
    (block (result i64) (br 0 (f32.const 1.0)) (br 0 (i64.const 1)))
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-break-first-i64-vs-f64 (result i64)
    (block (result i64) (br 0 (f64.const 1.0)) (br 0 (i64.const 1)))
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-break-first-f32-vs-i32 (result f32)
    (block (result f32) (br 0 (i32.const 1)) (br 0 (f32.const 1.0)))
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-break-first-f32-vs-i64 (result f32)
    (block (result f32) (br 0 (i64.const 1)) (br 0 (f32.const 1.0)))
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-break-first-f32-vs-f64 (result f32)
    (block (result f32) (br 0 (f64.const 1.0)) (br 0 (f32.const 1.0)))
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-break-first-f64-vs-i32 (result f64)
    (block (result f64) (br 0 (i32.const 1)) (br 0 (f64.const 1.0)))
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-break-first-f64-vs-i64 (result f64)
    (block (result f64) (br 0 (i64.const 1)) (br 0 (f64.const 1.0)))
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-break-first-f64-vs-f32 (result f64)
    (block (result f64) (br 0 (f32.const 1.0)) (br 0 (f64.const 1.0)))
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-break-first-num-vs-nums (result i32 i32)
    (block (result i32 i32) (br 0 (i32.const 0)) (br 0 (i32.const 1) (i32.const 2)))
  ))
  "type mismatch"
)

(assert_invalid
  (module (func $type-break-nested-i32-vs-void
    (block (result i32) (block (result i32) (br 1 (i32.const 1))) (br 0))
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-break-nested-i64-vs-void
    (block (result i64) (block (result i64) (br 1 (i64.const 1))) (br 0))
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-break-nested-f32-vs-void
    (block (result f32) (block (result f32) (br 1 (f32.const 1.0))) (br 0))
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-break-nested-f64-vs-void
    (block (result f64) (block (result f64) (br 1 (f64.const 1.0))) (br 0))
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-break-nested-nums-vs-void
    (block (result i32 i32) (block (result i32 i32) (br 1 (i32.const 1) (i32.const 2))) (br 0))
  ))
  "type mismatch"
)

(assert_invalid
  (module (func $type-break-nested-empty-vs-i32 (result i32)
    (block (result i32) (block (br 1)) (br 0 (i32.const 1)))
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-break-nested-empty-vs-i64 (result i64)
    (block (result i64) (block (br 1)) (br 0 (i64.const 1)))
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-break-nested-empty-vs-f32 (result f32)
    (block (result f32) (block (br 1)) (br 0 (f32.const 1.0)))
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-break-nested-empty-vs-f64 (result f64)
    (block (result f64) (block (br 1)) (br 0 (f64.const 1)))
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-break-nested-empty-vs-nums (result i32 i32)
    (block (result i32 i32) (block (br 1)) (br 0 (i32.const 1) (i32.const 2)))
  ))
  "type mismatch"
)

(assert_invalid
  (module (func $type-break-nested-void-vs-i32 (result i32)
    (block (result i32) (block (result i32) (br 1 (nop))) (br 0 (i32.const 1)))
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-break-nested-void-vs-i64 (result i64)
    (block (result i64) (block (result i64) (br 1 (nop))) (br 0 (i64.const 1)))
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-break-nested-void-vs-f32 (result f32)
    (block (result f32) (block (result f32) (br 1 (nop))) (br 0 (f32.const 1.0)))
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-break-nested-void-vs-f64 (result f64)
    (block (result f64) (block (result f64) (br 1 (nop))) (br 0 (f64.const 1.0)))
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-break-nested-void-vs-nums (result i32 i32)
    (block (result i32 i32) (block (result i32 i32) (br 1 (nop))) (br 0 (i32.const 1) (i32.const 2)))
  ))
  "type mismatch"
)

(assert_invalid
  (module (func $type-break-nested-i32-vs-i64 (result i32)
    (block (result i32)
      (block (result i32) (br 1 (i64.const 1))) (br 0 (i32.const 1))
    )
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-break-nested-i32-vs-f32 (result i32)
    (block (result i32)
      (block (result i32) (br 1 (f32.const 1.0))) (br 0 (i32.const 1))
    )
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-break-nested-i32-vs-f64 (result i32)
    (block (result i32)
      (block (result i32) (br 1 (f64.const 1.0))) (br 0 (i32.const 1))
    )
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-break-nested-i64-vs-i32 (result i64)
    (block (result i64)
      (block (result i64) (br 1 (i32.const 1))) (br 0 (i64.const 1))
    )
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-break-nested-i64-vs-f32 (result i64)
    (block (result i64)
      (block (result i64) (br 1 (f32.const 1.0))) (br 0 (i64.const 1))
    )
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-break-nested-i64-vs-f64 (result i64)
    (block (result i64)
      (block (result i64) (br 1 (f64.const 1.0))) (br 0 (i64.const 1))
    )
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-break-nested-f32-vs-i32 (result f32)
    (block (result f32)
      (block (result f32) (br 1 (i32.const 1))) (br 0 (f32.const 1.0))
    )
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-break-nested-f32-vs-i64 (result f32)
    (block (result f32)
      (block (result f32) (br 1 (i64.const 1))) (br 0 (f32.const 1.0))
    )
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-break-nested-f32-vs-f64 (result f32)
    (block (result f32)
      (block (result f32) (br 1 (f64.const 1.0))) (br 0 (f32.const 1.0))
    )
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-break-nested-f64-vs-i32 (result f64)
    (block (result f64)
      (block (result f64) (br 1 (i32.const 1))) (br 0 (f64.const 1.0))
    )
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-break-nested-f64-vs-i64 (result f64)
    (block (result f64)
      (block (result f64) (br 1 (i64.const 1))) (br 0 (f64.const 1.0))
    )
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-break-nested-f64-vs-f32 (result f64)
    (block (result f64)
      (block (result f64) (br 1 (f32.const 1.0))) (br 0 (f64.const 1.0))
    )
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-break-nested-num-vs-nums (result i32 i32)
    (block (result i32 i32)
      (block (result i32 i32) (br 1 (i32.const 0))) (br 0 (i32.const 1) (i32.const 2))
    )
  ))
  "type mismatch"
)

(assert_invalid
  (module (func $type-break-operand-empty-vs-i32 (result i32)
    (i32.ctz (block (br 0)))
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-break-operand-empty-vs-i64 (result i64)
    (i64.ctz (block (br 0)))
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-break-operand-empty-vs-f32 (result f32)
    (f32.floor (block (br 0)))
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-break-operand-empty-vs-f64 (result f64)
    (f64.floor (block (br 0)))
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-break-operand-empty-vs-nums (result i32)
    (i32.add (block (br 0)))
  ))
  "type mismatch"
)

(assert_invalid
  (module (func $type-break-operand-void-vs-i32 (result i32)
    (i32.ctz (block (br 0 (nop))))
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-break-operand-void-vs-i64 (result i64)
    (i64.ctz (block (br 0 (nop))))
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-break-operand-void-vs-f32 (result f32)
    (f32.floor (block (br 0 (nop))))
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-break-operand-void-vs-f64 (result f64)
    (f64.floor (block (br 0 (nop))))
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-break-operand-void-vs-nums (result i32)
    (i32.add (block (br 0 (nop))))
  ))
  "type mismatch"
)

(assert_invalid
  (module (func $type-break-operand-i32-vs-i64 (result i32)
    (i64.ctz (block (br 0 (i64.const 9))))
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-break-operand-i32-vs-f32 (result i32)
    (f32.floor (block (br 0 (f32.const 9.0))))
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-break-operand-i32-vs-f64 (result i32)
    (f64.floor (block (br 0 (f64.const 9.0))))
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-break-operand-i64-vs-i32 (result i64)
    (i32.ctz (block (br 0 (i32.const 9))))
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-break-operand-i64-vs-f32 (result i64)
    (f32.floor (block (br 0 (f32.const 9.0))))
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-break-operand-i64-vs-f64 (result i64)
    (f64.floor (block (br 0 (f64.const 9.0))))
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-break-operand-f32-vs-i32 (result f32)
    (i32.ctz (block (br 0 (i32.const 9))))
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-break-operand-f32-vs-i64 (result f32)
    (i64.ctz (block (br 0 (i64.const 9))))
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-break-operand-f32-vs-f64 (result f32)
    (f64.floor (block (br 0 (f64.const 9.0))))
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-break-operand-f64-vs-i32 (result f64)
    (i32.ctz (block (br 0 (i32.const 9))))
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-break-operand-f64-vs-i64 (result f64)
    (i64.ctz (block (br 0 (i64.const 9))))
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-break-operand-f64-vs-f32 (result f64)
    (f32.floor (block (br 0 (f32.const 9.0))))
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-break-operand-num-vs-nums (result i32)
    (i32.add (block (br 0 (i64.const 9) (i32.const 10))))
  ))
  "type mismatch"
)

(assert_invalid
  (module (func $type-param-void-vs-num
    (block (param i32) (drop))
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-param-void-vs-nums
    (block (param i32 f64) (drop) (drop))
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-param-num-vs-num
    (f32.const 0) (block (param i32) (drop))
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-param-num-vs-nums
    (f32.const 0) (block (param f32 i32) (drop) (drop))
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-param-nested-void-vs-num
    (block (block (param i32) (drop)))
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-param-void-vs-nums
    (block (block (param i32 f64) (drop) (drop)))
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-param-num-vs-num
    (block (f32.const 0) (block (param i32) (drop)))
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-param-num-vs-nums
    (block (f32.const 0) (block (param f32 i32) (drop) (drop)))
  ))
  "type mismatch"
)

(assert_malformed
  (module quote "(func (param i32) (result i32) block (param $x i32) end)")
  "unexpected token"
)
(assert_malformed
  (module quote "(func (param i32) (result i32) (block (param $x i32)))")
  "unexpected token"
)


(assert_malformed
  (module quote "(func block end $l)")
  "mismatching label"
)
(assert_malformed
  (module quote "(func block $a end $l)")
  "mismatching label"
)

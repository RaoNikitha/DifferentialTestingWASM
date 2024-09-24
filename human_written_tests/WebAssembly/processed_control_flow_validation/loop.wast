;; Test `loop` opcode

(assert_malformed
  (module quote
    "(type $sig (func (param i32) (result i32)))"
    "(func (i32.const 0) (loop (type $sig) (result i32) (param i32)))"
  )
  "unexpected token"
)
(assert_malformed
  (module quote
    "(type $sig (func (param i32) (result i32)))"
    "(func (i32.const 0) (loop (param i32) (type $sig) (result i32)))"
  )
  "unexpected token"
)
(assert_malformed
  (module quote
    "(type $sig (func (param i32) (result i32)))"
    "(func (i32.const 0) (loop (param i32) (result i32) (type $sig)))"
  )
  "unexpected token"
)
(assert_malformed
  (module quote
    "(type $sig (func (param i32) (result i32)))"
    "(func (i32.const 0) (loop (result i32) (type $sig) (param i32)))"
  )
  "unexpected token"
)
(assert_malformed
  (module quote
    "(type $sig (func (param i32) (result i32)))"
    "(func (i32.const 0) (loop (result i32) (param i32) (type $sig)))"
  )
  "unexpected token"
)
(assert_malformed
  (module quote
    "(func (i32.const 0) (loop (result i32) (param i32)))"
  )
  "unexpected token"
)

(assert_malformed
  (module quote "(func (i32.const 0) (loop (param $x i32) (drop)))")
  "unexpected token"
)
(assert_malformed
  (module quote
    "(type $sig (func))"
    "(func (loop (type $sig) (result i32) (i32.const 0)) (unreachable))"
  )
  "inline function type"
)
(assert_malformed
  (module quote
    "(type $sig (func (param i32) (result i32)))"
    "(func (loop (type $sig) (result i32) (i32.const 0)) (unreachable))"
  )
  "inline function type"
)
(assert_malformed
  (module quote
    "(type $sig (func (param i32) (result i32)))"
    "(func (i32.const 0) (loop (type $sig) (param i32) (drop)) (unreachable))"
  )
  "inline function type"
)
(assert_malformed
  (module quote
    "(type $sig (func (param i32 i32) (result i32)))"
    "(func (i32.const 0) (loop (type $sig) (param i32) (result i32)) (unreachable))"
  )
  "inline function type"
)

(assert_invalid
  (module
    (type $sig (func))
    (func (loop (type $sig) (i32.const 0)))
  )
  "type mismatch"
)

(assert_invalid
  (module (func $type-empty-i32 (result i32) (loop)))
  "type mismatch"
)
(assert_invalid
  (module (func $type-empty-i64 (result i64) (loop)))
  "type mismatch"
)
(assert_invalid
  (module (func $type-empty-f32 (result f32) (loop)))
  "type mismatch"
)
(assert_invalid
  (module (func $type-empty-f64 (result f64) (loop)))
  "type mismatch"
)

(assert_invalid
  (module (func $type-value-num-vs-void
    (loop (i32.const 1))
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-value-nums-vs-void
    (loop (i32.const 1) (i32.const 2))
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-value-empty-vs-num (result i32)
    (loop (result i32))
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-value-empty-vs-nums (result i32 i32)
    (loop (result i32 i32))
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-value-void-vs-num (result i32)
    (loop (result i32) (nop))
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-value-void-vs-nums (result i32 i32)
    (loop (result i32 i32) (nop))
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-value-num-vs-num (result i32)
    (loop (result i32) (f32.const 0))
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-value-num-vs-nums (result i32 i32)
    (loop (result i32 i32) (i32.const 0))
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-value-partial-vs-nums (result i32 i32)
    (i32.const 1) (loop (result i32 i32) (i32.const 2))
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-value-nums-vs-num (result i32)
    (loop (result i32) (i32.const 1) (i32.const 2))
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-value-unreached-select (result i32)
    (loop (result i64) (select (unreachable) (unreachable) (unreachable)))
  ))
  "type mismatch"
)

(assert_invalid
  (module
    (func $type-value-empty-in-block
      (i32.const 0)
      (block (loop (result i32)) (drop))
    )
  )
  "type mismatch"
)
(assert_invalid
  (module
    (func $type-value-empty-in-loop
      (i32.const 0)
      (loop (loop (result i32)) (drop))
    )
  )
  "type mismatch"
)
(assert_invalid
  (module
    (func $type-value-empty-in-then
      (i32.const 0) (i32.const 0)
      (if (then (loop (result i32)) (drop)))
    )
  )
  "type mismatch"
)

(assert_invalid
  (module (func $type-param-void-vs-num
    (loop (param i32) (drop))
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-param-void-vs-nums
    (loop (param i32 f64) (drop) (drop))
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-param-num-vs-num
    (f32.const 0) (loop (param i32) (drop))
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-param-num-vs-nums
    (f32.const 0) (loop (param f32 i32) (drop) (drop))
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-param-nested-void-vs-num
    (block (loop (param i32) (drop)))
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-param-void-vs-nums
    (block (loop (param i32 f64) (drop) (drop)))
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-param-num-vs-num
    (block (f32.const 0) (loop (param i32) (drop)))
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-param-num-vs-nums
    (block (f32.const 0) (loop (param f32 i32) (drop) (drop)))
  ))
  "type mismatch"
)

(assert_malformed
  (module quote "(func (param i32) (result i32) loop (param $x i32) end)")
  "unexpected token"
)
(assert_malformed
  (module quote "(func (param i32) (result i32) (loop (param $x i32)))")
  "unexpected token"
)

(assert_malformed
  (module quote "(func loop end $l)")
  "mismatching label"
)
(assert_malformed
  (module quote "(func loop $a end $l)")
  "mismatching label"
)

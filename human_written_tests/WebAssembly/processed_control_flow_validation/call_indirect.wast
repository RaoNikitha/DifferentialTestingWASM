;; Test `call_indirect` operator

;; Invalid syntax

(assert_malformed
  (module quote
    "(type $sig (func (param i32) (result i32)))"
    "(table 0 funcref)"
    "(func (result i32)"
    "  (call_indirect (type $sig) (result i32) (param i32)"
    "    (i32.const 0) (i32.const 0)"
    "  )"
    ")"
  )
  "unexpected token"
)
(assert_malformed
  (module quote
    "(type $sig (func (param i32) (result i32)))"
    "(table 0 funcref)"
    "(func (result i32)"
    "  (call_indirect (param i32) (type $sig) (result i32)"
    "    (i32.const 0) (i32.const 0)"
    "  )"
    ")"
  )
  "unexpected token"
)
(assert_malformed
  (module quote
    "(type $sig (func (param i32) (result i32)))"
    "(table 0 funcref)"
    "(func (result i32)"
    "  (call_indirect (param i32) (result i32) (type $sig)"
    "    (i32.const 0) (i32.const 0)"
    "  )"
    ")"
  )
  "unexpected token"
)
(assert_malformed
  (module quote
    "(type $sig (func (param i32) (result i32)))"
    "(table 0 funcref)"
    "(func (result i32)"
    "  (call_indirect (result i32) (type $sig) (param i32)"
    "    (i32.const 0) (i32.const 0)"
    "  )"
    ")"
  )
  "unexpected token"
)
(assert_malformed
  (module quote
    "(type $sig (func (param i32) (result i32)))"
    "(table 0 funcref)"
    "(func (result i32)"
    "  (call_indirect (result i32) (param i32) (type $sig)"
    "    (i32.const 0) (i32.const 0)"
    "  )"
    ")"
  )
  "unexpected token"
)
(assert_malformed
  (module quote
    "(table 0 funcref)"
    "(func (result i32)"
    "  (call_indirect (result i32) (param i32) (i32.const 0) (i32.const 0))"
    ")"
  )
  "unexpected token"
)

(assert_malformed
  (module quote
    "(table 0 funcref)"
    "(func (call_indirect (param $x i32) (i32.const 0) (i32.const 0)))"
  )
  "unexpected token"
)
(assert_malformed
  (module quote
    "(type $sig (func))"
    "(table 0 funcref)"
    "(func (result i32)"
    "  (call_indirect (type $sig) (result i32) (i32.const 0))"
    ")"
  )
  "inline function type"
)
(assert_malformed
  (module quote
    "(type $sig (func (param i32) (result i32)))"
    "(table 0 funcref)"
    "(func (result i32)"
    "  (call_indirect (type $sig) (result i32) (i32.const 0))"
    ")"
  )
  "inline function type"
)
(assert_malformed
  (module quote
    "(type $sig (func (param i32) (result i32)))"
    "(table 0 funcref)"
    "(func"
    "  (call_indirect (type $sig) (param i32) (i32.const 0) (i32.const 0))"
    ")"
  )
  "inline function type"
)
(assert_malformed
  (module quote
    "(type $sig (func (param i32 i32) (result i32)))"
    "(table 0 funcref)"
    "(func (result i32)"
    "  (call_indirect (type $sig) (param i32) (result i32)"
    "    (i32.const 0) (i32.const 0)"
    "  )"
    ")"
  )
  "inline function type"
)

;; Invalid typing

(assert_invalid
  (module
    (type (func))
    (func $no-table (call_indirect (type 0) (i32.const 0)))
  )
  "unknown table"
)

(assert_invalid
  (module
    (type (func))
    (table 0 funcref)
    (func $type-void-vs-num (i32.eqz (call_indirect (type 0) (i32.const 0))))
  )
  "type mismatch"
)
(assert_invalid
  (module
    (type (func (result i64)))
    (table 0 funcref)
    (func $type-num-vs-num (i32.eqz (call_indirect (type 0) (i32.const 0))))
  )
  "type mismatch"
)

(assert_invalid
  (module
    (type (func (param i32)))
    (table 0 funcref)
    (func $arity-0-vs-1 (call_indirect (type 0) (i32.const 0)))
  )
  "type mismatch"
)
(assert_invalid
  (module
    (type (func (param f64 i32)))
    (table 0 funcref)
    (func $arity-0-vs-2 (call_indirect (type 0) (i32.const 0)))
  )
  "type mismatch"
)
(assert_invalid
  (module
    (type (func))
    (table 0 funcref)
    (func $arity-1-vs-0 (call_indirect (type 0) (i32.const 1) (i32.const 0)))
  )
  "type mismatch"
)
(assert_invalid
  (module
    (type (func))
    (table 0 funcref)
    (func $arity-2-vs-0
      (call_indirect (type 0) (f64.const 2) (i32.const 1) (i32.const 0))
    )
  )
  "type mismatch"
)

(assert_invalid
  (module
    (type (func (param i32)))
    (table 0 funcref)
    (func $type-func-void-vs-i32 (call_indirect (type 0) (i32.const 1) (nop)))
  )
  "type mismatch"
)
(assert_invalid
  (module
    (type (func (param i32)))
    (table 0 funcref)
    (func $type-func-num-vs-i32 (call_indirect (type 0) (i32.const 0) (i64.const 1)))
  )
  "type mismatch"
)

(assert_invalid
  (module
    (type (func (param i32 i32)))
    (table 0 funcref)
    (func $type-first-void-vs-num
      (call_indirect (type 0) (nop) (i32.const 1) (i32.const 0))
    )
  )
  "type mismatch"
)
(assert_invalid
  (module
    (type (func (param i32 i32)))
    (table 0 funcref)
    (func $type-second-void-vs-num
      (call_indirect (type 0) (i32.const 1) (nop) (i32.const 0))
    )
  )
  "type mismatch"
)
(assert_invalid
  (module
    (type (func (param i32 f64)))
    (table 0 funcref)
    (func $type-first-num-vs-num
      (call_indirect (type 0) (f64.const 1) (i32.const 1) (i32.const 0))
    )
  )
  "type mismatch"
)
(assert_invalid
  (module
    (type (func (param f64 i32)))
    (table 0 funcref)
    (func $type-second-num-vs-num
      (call_indirect (type 0) (i32.const 1) (f64.const 1) (i32.const 0))
    )
  )
  "type mismatch"
)

(assert_invalid
  (module
    (func $f (param i32))
    (type $sig (func (param i32)))
    (table funcref (elem $f))
    (func $type-first-empty-in-block
      (block
        (call_indirect (type $sig) (i32.const 0))
      )
    )
  )
  "type mismatch"
)
(assert_invalid
  (module
    (func $f (param i32 i32))
    (type $sig (func (param i32 i32)))
    (table funcref (elem $f))
    (func $type-second-empty-in-block
      (block
        (call_indirect (type $sig) (i32.const 0) (i32.const 0))
      )
    )
  )
  "type mismatch"
)
(assert_invalid
  (module
    (func $f (param i32))
    (type $sig (func (param i32)))
    (table funcref (elem $f))
    (func $type-first-empty-in-loop
      (loop
        (call_indirect (type $sig) (i32.const 0))
      )
    )
  )
  "type mismatch"
)
(assert_invalid
  (module
    (func $f (param i32 i32))
    (type $sig (func (param i32 i32)))
    (table funcref (elem $f))
    (func $type-second-empty-in-loop
      (loop
        (call_indirect (type $sig) (i32.const 0) (i32.const 0))
      )
    )
  )
  "type mismatch"
)
(assert_invalid
  (module
    (func $f (param i32))
    (type $sig (func (param i32)))
    (table funcref (elem $f))
    (func $type-first-empty-in-then
      (i32.const 0) (i32.const 0)
      (if
        (then
          (call_indirect (type $sig) (i32.const 0))
        )
      )
    )
  )
  "type mismatch"
)
(assert_invalid
  (module
    (func $f (param i32 i32))
    (type $sig (func (param i32 i32)))
    (table funcref (elem $f))
    (func $type-second-empty-in-then
      (i32.const 0) (i32.const 0)
      (if
        (then
          (call_indirect (type $sig) (i32.const 0) (i32.const 0))
        )
      )
    )
  )
  "type mismatch"
)


;; Unbound type

(assert_invalid
  (module
    (table 0 funcref)
    (func $unbound-type (call_indirect (type 1) (i32.const 0)))
  )
  "unknown type"
)
(assert_invalid
  (module
    (table 0 funcref)
    (func $large-type (call_indirect (type 1012321300) (i32.const 0)))
  )
  "unknown type"
)


;; Unbound function in table

(assert_invalid
  (module (table funcref (elem 0 0)))
  "unknown function"
)




;; Flat syntax

(module
  (table 1 funcref)
  (func unreachable call_indirect)
  (func unreachable call_indirect nop)
  (func unreachable call_indirect call_indirect)
  (func unreachable call_indirect (call_indirect))
  (func unreachable call_indirect call_indirect call_indirect)
  (func unreachable call_indirect (result))
  (func unreachable call_indirect (result) (result))
  (func unreachable call_indirect (result) (result) call_indirect)
  (func unreachable call_indirect (result) (result) call_indirect (result))
  (func (result i32) unreachable call_indirect select)
  (func (result i32) unreachable call_indirect select call_indirect)
)

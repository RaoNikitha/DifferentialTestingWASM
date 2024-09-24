;; 8. **Test Description**: Assemble test sequences where a `call_indirect`’s index is conditionally determined inside a loop, with potential branching out via `br` upon a successful call. Ensure that errors in table index handling (e.g., invalid indices) trigger loops that never exit unintentionally.

(assert_invalid
  (module
    (type (func (param i32)))
    (type (func (param i32 i32)))
    (table anyfunc (elem $func0 $func1 $func2))
    (func $func0 (param i32) (result i32)
      local.get 0
      i32.const 1
      i32.add)
    (func $func1 (param i32) (result i32)
      local.get 0
      i32.const 2
      i32.add)
    (func $func2 (param i32) (result i32)
      local.get 0
      i32.const 3
      i32.add)
    (func (param i32) (param i32)
      loop $loop
        local.get 0
        local.get 1
        call_indirect (type 0)
        br_if $loop
      end)
  )
  "type mismatch"
)
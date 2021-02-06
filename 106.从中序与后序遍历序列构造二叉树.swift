/*
 * @lc app=leetcode.cn id=106 lang=swift
 *
 * [106] 从中序与后序遍历序列构造二叉树
 */

// @lc code=start
/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init() { self.val = 0; self.left = nil; self.right = nil; }
 *     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
 *     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
 *         self.val = val
 *         self.left = left
 *         self.right = right
 *     }
 * }
 */
class Solution {
    func buildTree(_ inorder: [Int], _ postorder: [Int]) -> TreeNode? {
        guard inorder.count == postorder.count else {
            return nil
        }

        return _buildHelper(inorder, 0, inorder.count - 1, postorder, 0, postorder.count - 1)
    }

    func _buildHelper(_ inorder:[Int], _ inStart: Int, _ inEnd:Int, 
    _ postorder:[Int], _ postStart: Int, _ postEnd: Int) -> TreeNode? {
        guard inStart <= inEnd && postStart <= postEnd else {
            return nil
        }

        guard let rootIndex = inorder.firstIndex(of: postorder[postEnd]) else {
            return nil
        }

        let root = TreeNode(postorder[postEnd]);
        let rightNum = inEnd - rootIndex

        root.left = _buildHelper(inorder, inStart, rootIndex - 1, postorder, postStart, postEnd - rightNum - 1);
        root.right = _buildHelper(inorder, rootIndex + 1, inEnd, postorder, postEnd - rightNum, postEnd - 1);

        return root
    }
}
// @lc code=end
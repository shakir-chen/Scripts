#!/usr/bin/env python
# encoding: utf-8
# 20min
class CategoryTree:

    def __init__(self):
        self.t_parent = ""
        self.t_child = []
        pass

    def add_category(self, category, parent):
        if parent is None:
            self.t_parent = category
        elif parent == self.t_parent:
            # self.t_child.append(category)
            temp_tree = CategoryTree()
            temp_tree.t_parent = category
            self.t_child.append(temp_tree)
        else:
            for ttchild in self.t_child:
                self.add_category(category, ttchild)
        pass

    def get_children(self, parent):
        if parent == self.t_parent:
            return self.t_child
        return []

if __name__ == '__main__':
    c = CategoryTree()
    c.add_category('A', None)
    c.add_category('B', 'A')
    c.add_category('C', 'A')
    c.add_category('D', 'B')
    print(','.join(c.get_children('A') or []))

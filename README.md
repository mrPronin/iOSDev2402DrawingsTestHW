iOSDev2401DrawingsTestHW
========================
Ученик. 

1. Нарисуйте пятиконечную звезду
2. Добавьте окружности на концах звезды
3. Соедините окружности линиями

Студент.

4. Закрасте звезду любым цветом
5. При каждой перерисовке рисуйте пять таких звезд (только мелких) в рандомных точках экрана

Мастер

6. После того как вы попрактиковались со звездами нарисуйте что-то свое, проявите творчество

Супермен

7. Сделайте простую рисовалку - веду пальцем по экрану и рисую


Note
-------------------------------------------------------------------------------
Наибольший общий делитель
ru.wikipedia.org/wiki/Наибольший_общий_делитель

Greatest common divisor
http://en.wikipedia.org/wiki/Greatest_common_divisor

greatest common divisor Objective-C - Stack Overflow
http://stackoverflow.com/questions/7863988/greatest-common-divisor-objective-c

Алгоритм Евклида
ru.wikipedia.org/wiki/Алгоритм_Евклида

Бинарный алгоритм вычисления НОД
ru.wikipedia.org/wiki/Бинарный_алгоритм_вычисления_НОД

Правильная звезда строится точно так же как и правильный многоугольник, только угол между вершинами надо удвоить (утроить, учетверить и т.п.)

xi = xc + R*cos(2*pi/n*(k*i) + φ)
yi = yc + R*sin(2*pi/n*(k*i) + φ)

φ - угол первой вершины
i - номер вершины 0..(n-1)
Если НОД(k, n) = 1, то звезда вычерчивается за один проход.
Иначе состоит из НОД(k, n) многоугольников.

Тогда формулы немного меняются
xi = xc + R*cos(2*pi/n*(k*i + j) + φ)
yi = yc + R*sin(2*pi/n*(k*i + j) + φ)
j - номер многоугольника 0 .. НОД(k, n) - 1
i - номер вершины такого многоугольника 0 .. n/НОД(k, n) - 1

В принципе вторые формулы рисуют любые правильные многоугольники - и обычные и звезды

Если n = 2k, то звезда вырождается в набор из k отрезков, проходящих через центр.
n - число вершин звезды
k - число вершин, отсчитываемых для рисования стороны
Для обычной пятиконечной звезды n = 5, k = 2 (или k = 3, тогда пятиугольник будет отрисован в другом направлении, вообще если заменить k на n-k, меняется направление отрисовки)
Для звезды Давида n = 6, k = 2

    // the number of star vertices
    NSUInteger n = 5;
    
    // the number of vertices, which counted for drawing hand
    NSUInteger k = 2;
    
    // greatest common divisor
    NSUInteger ni01 = k;
    NSUInteger ni02 = n;
    NSUInteger tmp = 0;
    
    while (ni02 != 0) {
        tmp = ni01 % ni02;
        ni01 = ni02;
        ni02 = tmp;
    }
    
    NSLog(@"GCD: %d", ni01);

/* Set the line width in the current graphics state to `width'. */

CG_EXTERN void CGContextSetLineWidth(CGContextRef c, CGFloat width)
  CG_AVAILABLE_STARTING(__MAC_10_0, __IPHONE_2_0);


/* Set the line join in the current graphics state to `join'. */

CG_EXTERN void CGContextSetLineJoin(CGContextRef c, CGLineJoin join)
  CG_AVAILABLE_STARTING(__MAC_10_0, __IPHONE_2_0);

/* Append a straight line segment from the current point to `(x, y)'. */

CG_EXTERN void CGContextAddLineToPoint(CGContextRef c, CGFloat x, CGFloat y)
  CG_AVAILABLE_STARTING(__MAC_10_0, __IPHONE_2_0);

/* Append a cubic Bezier curve from the current point to `(x,y)', with
   control points `(cp1x, cp1y)' and `(cp2x, cp2y)'. */

CG_EXTERN void CGContextAddCurveToPoint(CGContextRef c, CGFloat cp1x,
  CGFloat cp1y, CGFloat cp2x, CGFloat cp2y, CGFloat x, CGFloat y)
  CG_AVAILABLE_STARTING(__MAC_10_0, __IPHONE_2_0);

/* Append a quadratic curve from the current point to `(x, y)', with control
   point `(cpx, cpy)'. */

CG_EXTERN void CGContextAddQuadCurveToPoint(CGContextRef c, CGFloat cpx,
  CGFloat cpy, CGFloat x, CGFloat y)
  CG_AVAILABLE_STARTING(__MAC_10_0, __IPHONE_2_0);

/* Add a single rect to the context's path. */

CG_EXTERN void CGContextAddRect(CGContextRef c, CGRect rect)
  CG_AVAILABLE_STARTING(__MAC_10_0, __IPHONE_2_0);

/* Add an ellipse inside `rect' to the current path of `context'. See the
   function `CGPathAddEllipseInRect' for more information on how the path
   for the ellipse is constructed. */

CG_EXTERN void CGContextAddEllipseInRect(CGContextRef context, CGRect rect)
  CG_AVAILABLE_STARTING(__MAC_10_4, __IPHONE_2_0);

Quartz 2D Programming Guide
https://developer.apple.com/library/ios/documentation/GraphicsImaging/Conceptual/drawingwithquartz2d/

Drawing and Printing Guide for iOS
https://developer.apple.com/library/ios/documentation/2DDrawing/Conceptual/DrawingPrintingiOS/

Core Image Programming Guide
https://developer.apple.com/library/ios/documentation/GraphicsImaging/Conceptual/CoreImaging/
-------------------------------------------------------------------------------
